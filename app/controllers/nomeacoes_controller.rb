class NomeacoesController < InheritedResources::Base
  load_and_authorize_resource

  belongs_to :membro
  def index
  	@nomeacoes = Nomeacao.paginate :page => params[:page], :per_page => 10
  end
end
