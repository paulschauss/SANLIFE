class FoodsController < ApplicationController
  def index
    @nutrients = Nutrient.where(id: params[:nutrient_ids])
  end

  def next
    proposed_food_ids = cookies[:proposed_foods].split(',')
    nutrient = Nutrient.find(params[:nutrient_id])
    food = nutrient.foods.order(measure_value: :desc).where.not(id: proposed_food_ids).first

    proposed_food_ids << food.id
    cookies[:proposed_foods] = proposed_food_ids.map(&:to_s).join(',')

    render partial: 'food_cards', locals: { food: food, nutrient: nutrient }, formats: [:html]
  end


  def filter_foods(new_food)
    if cookies[:proposed_foods].include?(new_food.id)
      # next
    else
      new_food
    end
  end

end
