class UsersController < ApplicationController
  before_action :verify_user_setup, only: [:show]

  def show
  end

  private

  def verify_user_setup
    redirect_to new_user_illness_path, notice: "finisser" if current_user.user_illnesses.empty?
  end
end
