class UserMailer < ApplicationMailer

  def ingredient
    @user = params[:user]

    mail(to: @user.email, subject: "Your ingredient list 😋")
  end
end
