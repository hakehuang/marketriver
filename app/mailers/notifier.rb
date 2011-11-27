class Notifier < ActionMailer::Base
  default :from => "happy@enjoybee.com"
  def transaction(recipient, p)
    @user = recipient
    @product = p
    mail(:to => recipient.email, :subject => t(:transactsubmit)) 
  end
end
