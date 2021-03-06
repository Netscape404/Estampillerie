class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email last_name first_name birthdate gender biography address post_code city country])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[last_name first_name birthdate gender biography address post_code city country])
  end

  rescue_from CanCan::AccessDenied do |exception|
    #Redirect to the last page
    redirect_to request.referrer, :alert => exception.message
  end

end
