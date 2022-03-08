class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]
  before_action :verify_user_setup, only: [:dashboard]

  def home
  end

  def dashboard
    @user_illnesses = UserIllness.all
  end

  def preferences
    @illnesses = Illness.all

    @nutrients = current_user.nutrients
    @nutrients_with_food = FoodByNutrientService.call(@nutrients, [])

    cookies[:proposed_foods] = @nutrients_with_food.values.flatten.map(&:id).map(&:to_s).join (',')
    cookies[:saved_foods] = @nutrients_with_food.values.flatten.map(&:id).map(&:to_s).join (',')
    cookies[:excluded_foods] = []

    illness_ids = []
    UserIllness.all.each do |user_illness|
      illness_ids << user_illness.illness_id
    end

    illness_nutrients = IllnessNutrient.select("illness_nutrients.\"nutrient_id\", SUM(weight) / #{illness_ids.size} as impact")
                                      .where(illness_id: illness_ids)
                                      .group(:nutrient_id)

    @impact = illness_nutrients.map { |inn| [inn.nutrient.name, inn.impact] }.to_h
  end


  private

  def verify_user_setup
    redirect_to preferences_path, notice: "Please choose a health concern!" if current_user.user_illnesses.empty?
  end
end
