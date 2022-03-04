class PagesController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: [:home, :preferences, :dashboard]
  # before_action :verify_user_setup, only: [:dashboard]

=======
  skip_before_action :authenticate_user!, only: [:home]
  before_action :verify_user_setup, only: [:dashboard]
>>>>>>> b3b4f87c62e88b5a96f2bc0bf4af2c976f671b92

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
    redirect_to preferences_path, notice: "Please choose a health concern!" if current_user.user_illnesses.empty?
  end
end
