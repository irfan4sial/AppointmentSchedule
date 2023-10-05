class UserMailer < ApplicationMailer
  default from: "info@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "abc", body: "ddd")
  end
end
