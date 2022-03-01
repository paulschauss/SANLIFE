class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_illnesses, dependent: :destroy
  has_many :illnesses, through: :user_illnesses, dependent: :destroy

  # validates :date_of_birth, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :illness, presence: true, length: { maximum: 4 }
end
