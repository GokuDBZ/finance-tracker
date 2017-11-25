class User::RegistrationsController < Devise::RegistrationsController
    before_filter :configure_permitted_parameters
    
    protected
    def configure_permitted_parameters
       # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstname, :middlename, :lastname, :nickname) }
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name])
        #devise_parameter_sanitizer.permit(:account_update).push(:first_name,:last_name) 
    end
end