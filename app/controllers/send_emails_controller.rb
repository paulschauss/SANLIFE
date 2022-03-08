class SendEmailsController < ApplicationController
  def nutrient_email
    UserMailer.with(user: current_user, food_ids: cookies[:proposed_foods].split(',').map(&:to_i) ).email.deliver_now

    # to prevent reload page and lose cookies
    # redirect_back(fallback_location: root_path, notice: 'your email has been sent!')
    head :no_content
  end
end
