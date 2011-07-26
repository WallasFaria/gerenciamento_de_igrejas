class HomeController < ApplicationController
  load_and_authorize_resource

  def show
	@filial = Filial.find(current_usuario.filial.id)
  end

end
