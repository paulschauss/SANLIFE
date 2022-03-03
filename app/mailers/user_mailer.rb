class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  def ingredient
    @user = params[:user]

    mail to: @user.email, subject: "Your ingredient list 😋"
  end
end
