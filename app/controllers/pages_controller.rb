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

    @nutrients_with_food = @nutrients.map {|nutrient| [nutrient, nutrient.foods.order(measure_value: :desc).limit(4)] }.to_h

    cookies[:proposed_foods] = @nutrients_with_food.values.flatten.map(&:id).map(&:to_s).join (',')
  end

  private

  def verify_user_setup
    redirect_to preferences_path, notice: "finisser" if current_user.user_illnesses.empty?
  end
end
