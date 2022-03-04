class FoodsController < ApplicationController
  def index
    @nutrients = Nutrient.where(id: params[:nutrient_ids])
  end

  def refresh
    render partial: 'food_cards', locals: { food: Food.all.sample }, formats: [:html]
  end
end
