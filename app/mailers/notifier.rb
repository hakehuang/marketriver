class Notifier < ActionMailer::Base
  default :from => "happy@enjoybee.com"
  def transaction(recipient, p)
    @user = recipient
    @product = p
    @update = false 
    mail(:to => recipient.email, :subject => t(:transactsubmit)) 
  end
  def update(recipient, p)
    @user = recipient
    @product = p
    @update = true 
    mail(:to => recipient.email, :subject => t(:transactstatus)) 
  end
end
