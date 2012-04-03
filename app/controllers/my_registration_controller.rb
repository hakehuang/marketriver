class MyRegistrationController < Devise::RegistrationsController
prepend_view_path "app/views/devise"

def create
    super
    @email = params[:user][:email]
    #if ! @email.nil?
    #  Notifier.new_user(@email).deliver
    #end
end

def update
    super
end
end
