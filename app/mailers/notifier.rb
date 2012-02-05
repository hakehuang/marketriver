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
  def share_product(recipient,p)
    @user = recipient
    @product = p
    mail(:to => "psos15@gmail.com", :subject => t(:share_my_goods))
  end
  def new_user(recipient)
    @email = recipient
    mail(:to => "psos15@gmail.com", :subject => t(:register))
  end
end
