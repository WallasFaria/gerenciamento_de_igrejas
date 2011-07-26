class FiliaisController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @filiais = Filial.paginate :page => params[:page], :per_page => 10
  end
end
