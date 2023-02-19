class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
  alias_method :current_user, :current_usuario

  rescue_from CanCan::AccessDenied do |exception|
    render json: {
             warning: exception,
             status:
               "Este usuario no tiene el rol correcto para usar esta funcion"
           }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
