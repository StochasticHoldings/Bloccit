class SponsoredPostsController < ApplicationController

  def show
    @sponsored_posts = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_posts = SponsoredPost.new
  end

  def edit
    @sponosred_posts = SponsoredPost.find(params[:id])
  end
end
