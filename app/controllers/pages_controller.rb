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

    illness_ids = []
    UserIllness.all.each do |user_illness|
      illness_ids << user_illness.illness_id
    end

    @illness_nutrients = IllnessNutrient.select("illness_nutrients.\"nutrient_id\", SUM(weight) / #{illness_ids.size} as impact")
    .where(illness_id: illness_ids)
    .group(:nutrient_id)
    .order(impact: :desc)

    @nutrients = @illness_nutrients.map(&:nutrient)

    # @nutrients = current_user.nutrients.first(4)
    @nutrients_with_food = FoodByNutrientService.call(@nutrients, [])

    cookies[:proposed_foods] = @nutrients_with_food.values.flatten.map(&:id).map(&:to_s).join (',')
    cookies[:saved_foods] = @nutrients_with_food.values.flatten.map(&:id).map(&:to_s).join (',')
    cookies[:excluded_foods] = []

    # @impact_before_4 = illness_nutrients.map { |inn| [inn.nutrient.name, inn.impact] }.to_h.sort_by {|k,v| v}.reverse.first(4).to_h
    # @impact_after_4 = illness_nutrients.map { |inn| [inn.nutrient.name, inn.impact] }.to_h.sort_by {|k,v| v}.reverse.drop(4).to_h

  end


  private

  def verify_user_setup
    redirect_to preferences_path, notice: "Please choose a health concern!" if current_user.user_illnesses.empty?
  end
end
