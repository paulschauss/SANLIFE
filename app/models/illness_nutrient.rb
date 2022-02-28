class IllnessNutrient < ApplicationRecord
  belongs_to :nutrient
  belongs_to :illness
end
