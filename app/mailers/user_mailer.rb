class UserMailer < ActionMailer::Base
  default :from => "webmaster@enjoy.com"
  def welcome_email(user)
    @user = user
    @url  = "http://www.enjoybee.com/"
    mail(:to => user.email, :subject => t(:welcome))
  end
  def password_reset(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
         :subject => t(:passwdresetnotification))
  end
end
