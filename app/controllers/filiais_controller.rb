class FiliaisController < InheritedResources::Base
  def index
    @filiais = Filial.paginate :page => params[:page], :per_page => 10
  end
end
