class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_usuario

  private
    
  def current_usuario
    @current_usuario ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end
end
