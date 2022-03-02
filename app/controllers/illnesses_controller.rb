class IllnessesController < ApplicationController
  def index
    @illnesses = illness_names.all
  end
end
