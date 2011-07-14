class UsuariosController < ApplicationController

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
