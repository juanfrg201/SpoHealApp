class CommunityPostsController < ApplicationController
  before_action :set_community
  before_action :user_session!

  def new
    @community_post = @community.community_posts.new
  end

  def create
    @community_post = @community.community_posts.new(community_post_params)
    @community_post.user_id = current_user.id
    if @community_post.save
      redirect_to community_path(@community), notice: 'Publicación de comunidad creada con éxito.'
    else
      render :new
    end
  end

  private 

  def set_community
    @community = Community.find(params[:community_id])
  end

  def community_post_params 
    params.require(:community_post).permit(:issue, :body)
  end
end
