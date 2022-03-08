class FoodsController < ApplicationController
  def exclude
    excluded_foods = cookies[:excluded_foods].split(',')
    excluded_foods << params[:id].to_s
    cookies[:excluded_foods] = excluded_foods.join(',')
    head :no_content
  end
end
