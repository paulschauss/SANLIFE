class FoodsController < ApplicationController
  def index
    @nutrients = Nutrient.where(id: params[:nutrient_ids])
  end

  def next
    nutrient = Nutrient.find(params[:nutrient_id])

    proposed_food_ids = cookies[:proposed_foods].split(',')
    food = nutrient.foods.order(measure_value: :desc).where.not(id: proposed_food_ids).first
    proposed_food_ids << food.id
    cookies[:proposed_foods] = proposed_food_ids.map(&:to_s).join(',')
    ap cookies[:proposed_foods]
    render partial: 'food_cards', locals: { food: food, nutrient: nutrient }, formats: [:html]

    # before_food
    saved_foods_ids = cookies[:saved_foods].split(',')
    # saved_foods_ids.delete(???? LOOK AT LOGS)
    # saved_food_ids.push(food)
  end


  def filter_foods(new_food)
    if cookies[:proposed_foods].include?(new_food.id)
      # next
    else
      new_food
    end
  end

end
