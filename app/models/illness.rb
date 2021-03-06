class Illness < ApplicationRecord
  has_many :illness_nutrients, dependent: :destroy
  has_many :nutrients, through: :illness_nutrients
  has_many :users, through: :user_illnesses
  validates :name, presence: true, uniqueness: true
end
