class UsuariosController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @usuarios = Usuario.paginate :page => params[:page], :per_page => 10
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      redirect_to usuarios_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

end