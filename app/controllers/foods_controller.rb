class FoodsController < ApplicationController
  def index
    @nutrients = Nutrient.where(id: params[:nutrient_ids])
  end
end
