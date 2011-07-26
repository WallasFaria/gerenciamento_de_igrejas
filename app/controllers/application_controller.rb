class ApplicationController < ActionController::Base
  
  protect_from_forgery
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'Acesso Negado.'
    redirect_to root_url
  end

  private
    
  def current_user
    @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end
end
