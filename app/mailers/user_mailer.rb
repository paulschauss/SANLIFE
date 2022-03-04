class UserMailer < ApplicationMailer

  def ingredient
    @user = params[:user]

    mail(to: @user.email, subject: "Your Food Plan - SANLIFE")
  end
end
