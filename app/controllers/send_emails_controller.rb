class SendEmailsController < ApplicationController
  def nutrient_email
    UserMailer.with(user: current_user).ingredient.deliver_now

    # redirect_to :successfully_send,  notice: 'your email has been sent!'

    redirect_back(fallback_location: root_path, notice: 'your email has been sent!')
  end
end
