# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def email_with_two_foods
    UserMailer.with(user: User.find_by(email: "marie@sanlife.me"), food_ids: Food.pluck(:id).first(2)).email
  end

  def email_with_five_foods
    UserMailer.with(user: User.find_by(email: "marie@sanlife.me"), food_ids: Food.pluck(:id).first(5)).email
  end
end
