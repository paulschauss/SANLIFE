class IllnessNutrientsController < ApplicationController
  def index
    @nutrients = current_user.nutrients
    render partial: 'pages/vitamins_result', locals: { illness: @nutrients }
  end
end
