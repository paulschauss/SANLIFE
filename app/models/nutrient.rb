class Nutrient < ApplicationRecord
  has_many :nutrient_foods
  has_many :foods, through: :nutrient_foods
  has_many :illness_nutrients
  has_many :illnesses, through: :illness_nutrients
  validates :name, presence: true
end
