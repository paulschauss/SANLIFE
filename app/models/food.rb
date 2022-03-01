class Food < ApplicationRecord
  has_many :nutrient_foods, dependent: :destroy
  has_many :nutrients, through: :nutrient_foods
  validates :name, presence: true, uniqueness: true
end
