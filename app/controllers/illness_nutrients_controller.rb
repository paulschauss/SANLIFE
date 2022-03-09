class IllnessNutrientsController < ApplicationController
  def index
    @illnesses = current_user.illnesses
    illness_ids = @illnesses.ids
    @illness_nutrients = IllnessNutrient.select("illness_nutrients.\"nutrient_id\", SUM(weight) / #{illness_ids.size} as impact")
                                      .where(illness_id: illness_ids)
                                      .group(:nutrient_id)
                                      .order(impact: :desc)

    @nutrients = @illness_nutrients.map(&:nutrient)

    excluded_foods = cookies[:excluded_foods].split(',')
    @nutrients_with_food = FoodByNutrientService.call(@nutrients, excluded_foods)

    cookies[:proposed_foods] = @nutrients_with_food.values.flatten.map(&:id).map(&:to_s).join(',')


    # @impact_before_4 = illness_nutrients.map { |inn| [inn.nutrient.name, inn.impact] }.to_h.sort_by {|k,v| v}.reverse.first(4).to_h
    # @impact_after_4 = illness_nutrients.map { |inn| [inn.nutrient.name, inn.impact] }.to_h.sort_by {|k,v| v}.reverse.drop(4).to_h


    render partial: 'pages/vitamins_result', locals: { nutrients_with_food: @nutrients_with_food, impact: @impact}
  end
end
