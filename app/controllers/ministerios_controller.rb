class MinisteriosController < InheritedResources::Base
  load_and_authorize_resource

	def index
	  @ministerios = Ministerio.paginate :page => params[:page], :per_page => 10
	end
	
end
