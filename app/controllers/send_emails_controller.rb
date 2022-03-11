class SendEmailsController < ApplicationController
  def nutrient_email
    sleep(1.5)
    UserMailer.with(user: current_user, email: params[:email], excluded_food_ids: cookies[:excluded_foods].split(',').map(&:to_i))
              .email.deliver_now

    head :no_content
  end
end
