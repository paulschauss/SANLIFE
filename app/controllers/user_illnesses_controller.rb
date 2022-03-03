class UserIllnessesController < ApplicationController
  def add
    @illness = Illness.find(params[:id])
    @user_illness = UserIllness.create(user: current_user, illness: @illness)
    render partial: 'user_preferences', locals: { illness: @illness }
  end

  def remove
    @illness = Illness.find(params[:id])
    @user_illness = UserIllness.find_by(user: current_user, illness: @illness)
    @user_illness.destroy
  end
end
