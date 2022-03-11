class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def debug
    data = {
      cookies_proposed_foods: cookies[:proposed_foods],
      cookies_saved_foods: cookies[:saved_foods],
      proposed_foods: Food.where(id: cookies[:proposed_foods].split(',')).pluck(:name, :id).to_h,
      excluded_foods: cookies[:excluded_foods]
    }
    render json: data
  end
end
