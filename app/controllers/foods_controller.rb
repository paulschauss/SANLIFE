class FoodsController < ApplicationController
  def index
    @nutrients = Nutrient.where(id: params[:nutrient_ids])
  end

  def next
    ap cookies[:proposed_foods]
    nutrient = Nutrient.find(params[:nutrient_id])
    render partial: 'food_cards', locals: { food: Food.all.sample, nutrient: nutrient }, formats: [:html]
  end
end
