class UsersController < ApplicationController
  before_action :verify_user_setup, only: [:show]

  def show
  end

  def

  end

  private

  def verify_user_setup
    redirect_to preferences_path, notice: "finisser" if current_user.user_illnesses.empty?
  end
end
