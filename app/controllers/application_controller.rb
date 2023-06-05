class ApplicationController < ActionController::Base
  add_flash_types :error
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the `name` parameter along with the other sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
