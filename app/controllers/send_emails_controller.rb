class SendEmailsController < ApplicationController
  def nutrient_email
    UserMailer.with(user: User.first).ingredient.deliver_now

    return "Your email has been sent ! 😁"
  end

  def publish
    post = Post.find params[:id]
    post.publish!

    redirect_back(fallback_location: root_path)
  end
end
