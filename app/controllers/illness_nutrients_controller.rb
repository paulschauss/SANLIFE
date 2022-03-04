class IllnessNutrientsController < ApplicationController
  def index
    @nutrients = current_user.nutrients

    @nutrients_with_food = @nutrients.map {|nutrient| [nutrient, nutrient.foods.order(measure_value: :desc).limit(4)] }.to_h

    cookies[:proposed_foods] = @nutrients_with_food.values.flatten.map(&:id).map(&:to_s).join(',')

    render partial: 'pages/vitamins_result', locals: { nutrients_with_food: @nutrients_with_food }
  end
end
