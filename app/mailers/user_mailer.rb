class UserMailer < ActionMailer::Base
  default :from => "webmaster@enjoy.com"
  def welcome_email(user)
    @user = user
    @url  = "http://www.enjoybee.com/"
    mail(:to => user.email, :subject => "Welcome to www.EnjoyBee.com")
  end
  def password_reset(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
         :subject => 'Password Reset Notification')
  end
end
