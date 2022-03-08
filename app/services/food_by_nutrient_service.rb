# frozen_string_literal: true

class FoodByNutrientService < ApplicationService
  def initialize(nutrients, exclude_food_ids)
    @nutrients = nutrients
    @exclude_food_ids = exclude_food_ids
  end

  def call
    @nutrients.map do |nutrient|
      foods = nutrient.foods
                      .where.not(id: @exclude_food_ids)
                      .order(measure_value: :desc)
                      .limit(4)
      [nutrient, foods]
    end.to_h
  end
end
