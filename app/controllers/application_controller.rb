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

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
