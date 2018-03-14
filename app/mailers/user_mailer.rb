class UserMailer < ApplicationMailer

  def newsletter(user)
    @user = User.last
    mail(to: @user.email, subject: 'Thank you for subscribing')
  end
end
