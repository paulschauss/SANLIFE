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
  end

  private

  def verify_user_setup
    redirect_to preferences_path, notice: "finisser" if current_user.user_illnesses.empty?
  end
end
