class UserMailer < ActionMailer::Base
  default :from => "ubuntu@ubuntu-vm.com"
  def welcome_email(user)
    @user = user
    @url  = "http://218.211.65.85/"
    mail(:to => user.email, :subject => "Welcome to Bee.com")
  end
  def password_reset(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
         :subject => 'Password Reset Notification')
  end
end
