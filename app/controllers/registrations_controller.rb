class RegistrationsController < Devise::RegistrationsController

  protected

     def after_sign_up_path_for(resource)
       if user_signed_in?
          show_user_path(resource)
       elsif member_signed_in?
         show_member_path(resource)
       else
         redirect_to root_url
       end
     end
             
    def after_update_path_for(resource)
       show_user_path(resource)
    end
  end