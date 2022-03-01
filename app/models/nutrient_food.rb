class NutrientFood < ApplicationRecord
  belongs_to :food
  belongs_to :nutrient
end
