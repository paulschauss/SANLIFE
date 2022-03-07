class UserMailer < ApplicationMailer

  def email
    @user = params[:user]

    @foods = Food.find(params[:food_ids])

    @nutrients = @user.nutrients

    mail(to: @user.email, subject: "Your Food Plan")

  end
end
