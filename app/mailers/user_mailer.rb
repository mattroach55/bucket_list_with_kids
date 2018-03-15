class UserMailer < ApplicationMailer

  def welcome(user)
    @user = User.last
    mail(to: @user.email, subject: 'Welcome to Bucket List With Kids')
  end
end
