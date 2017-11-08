class PostsController < ApplicationController
  before_action :require_sign_in, except: :show
    before_action :authorize_admin, except: [:show, :new, :create]
    before_action :authorize_member, only: [:create, :update, :delete]
    before_action :authorize_moderator, only: [:create, :update]

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else

      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    require("pry-rails"); binding.pry
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
  # remember to add private methods to the bottom of the file. Any method defined below private, will be private.
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_admin
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  def authorize_member
    unless current_user.member?
      flash[:alert] = "You must be a member to do that."
      redirect_to root_path
    end
  end

  def authorize_moderator
    unless current_user.moderator?
      flash[:alert] = "You must be a moderator to do that."
      redirect_to root_path
    end
  end
end
