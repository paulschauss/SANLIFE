class FoodsController < ApplicationController
  def index
    @nutrients = Nutrient.where(id: params[:nutrient_ids])
    ap @nutrients
    # vitB12 = Nutrient.find(395)
    # @nutrient_foods_B12 = @nutrient_foods.find_by_nutrient(vitB12)
  end
end
