class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
    return stored_location_for(resource) || registsuccess_path
  end
  def after_sign_up_path_for(resource)
    return stored_location_for(resource) || root_path
  end
  def isadmin
   if current_user
   	@user = User.find_by_id(current_user.id)
   	if (@user and @user.admin)
          return
   	end
   end
   redirect_to new_user_session_path 
  end
end
