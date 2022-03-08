class IllnessNutrientsController < ApplicationController
  def index
    @nutrients = current_user.nutrients

    excluded_foods = cookies[:excluded_foods].split(',')
    @nutrients_with_food = FoodByNutrientService.call(@nutrients, excluded_foods)

    cookies[:proposed_foods] = @nutrients_with_food.values.flatten.map(&:id).map(&:to_s).join(',')

    @illnesses = current_user.illnesses
    illness_ids = @illnesses.ids
    illness_nutrients = IllnessNutrient.select("illness_nutrients.\"nutrient_id\", SUM(weight) / #{illness_ids.size} as impact")
                                      .where(illness_id: illness_ids)
                                      .group(:nutrient_id)


    @impact = illness_nutrients.map { |inn| [inn.nutrient.name, inn.impact] }.to_h



    render partial: 'pages/vitamins_result', locals: { nutrients_with_food: @nutrients_with_food, impact: @impact}
  end
end
