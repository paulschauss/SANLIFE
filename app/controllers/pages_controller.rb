class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user_illnesses = UserIllness.all
  end

  def preferences
    @illnesses = Illness.all
  end
end
