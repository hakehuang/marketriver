class Notifier < ActionMailer::Base
  default :from => "happy@enjoybee.com"
  def transaction(recipient, p, t)
    @account = recipient
    @product = p
    @transaction = t
    mail(:to => recipient.email) do |format|
  	format.text
  	format.html
    end
  end
end
