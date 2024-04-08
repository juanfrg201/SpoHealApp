class CommunityController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community, only: [:show]
  before_action :user_session!

  def index
    @communities = Community.all
  end

  def show
    @community_posts = @community.community_posts
  end

  def new
    @community = Community.new()
  end

  def create
    @community = Community.new(community_params)
    @community.user_id = current_user.id
    if @community.save
      flash[:notice] = "Comunidad creada con éxito."
      redirect_to community_index_path
    else
      render :new
    end
  end

  def destroy
  end

  private 

  def set_community 
    @community = Community.find(params[:id])
  end

  def community_params 
    params.require(:community).permit(:name , :issue, :image)
  end
end
