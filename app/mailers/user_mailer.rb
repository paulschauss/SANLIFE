class UserMailer < ApplicationMailer

  def email
    @user = params[:user]
    @nutrients = @user.nutrients.first(4)
    excluded_foods = params[:excluded_foods]
    @nutrients_with_food = FoodByNutrientService.call(@nutrients, excluded_foods)

    mail(to: params[:email], subject: "Your Food Plan")
  end
end
