class IllnessesController < ApplicationController
  def index
    @illnesses = illness_names.all
  end

  # faire une method add and remove dans IllnessesController

  # POST illness/:illness_id/add => on créer un UserIllness
  # on chope le current_user
  # on chope le illness_id
  # on créer un UserIllness avec current_user.id + illness_id
  def add
    @current_user = current_user.id
    @illness_id = Illness.find(params[:illness_id])
  end

  # POST illness/:illness_id/remove => on supprime un UserIllness
  # on chope le current_user
  # on chope le UserIllnessness qui a comme illness_id celui de l url UserIllnessness.find_by(user_id: current_user.id, illness_id: params[:illness_id])
  # on créer un UserIllness avec current_user.id + illness_id
  def remove
  end
end
