class ApplicationController < ActionController::Base
  protect_from_forgery
  
   def after_sign_in_path_for(resource)
       if user_signed_in?
       stored_location_for(resource) || show_user_path
     elsif member_signed_in?
       stored_location_for(resource) || show_member_path
     else
       redirect_to root_url
     end
   end

  
end
