class UserMailer < ApplicationMailer

  def email
    @user = params[:user]

    @foods = Food.find(params[:food_ids])

    @nutrients = @user.nutrients
    @nutrients_with_food = @nutrients.map {|nutrient| [nutrient, nutrient.foods.order(measure_value: :desc).limit(4)] }.to_h

    mail(to: @user.email, subject: "Your Food Plan")

  end
end
