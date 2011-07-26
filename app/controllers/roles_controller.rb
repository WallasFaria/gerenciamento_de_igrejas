class RolesController < InheritedResources::Base
  load_and_authorize_resource
  
  def index
    @roles = Role.paginate :page => params[:page], :per_page => 10
  end
end
