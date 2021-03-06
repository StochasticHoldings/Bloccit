class TopicsController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_moderator, only: [:update, :edit]
  before_action :authorize_user, only: [:create, :destroy, :new]

  def index
    #require("pry-rails"); binding.pry
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

def create
     @topic = Topic.new(topic_params)

     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
   end

   def edit
     #require("pry-rails"); binding.pry
  @topic = Topic.find(params[:id])
end

def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
       flash[:notice] = "Topic was updated."
      redirect_to @topic
    else
      flash.now[:alert] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
        flash[:notice] = "Topic was deleted!"
        redirect_to topics_path
    else
      redirect_to :back
    end
  end

  def topic_params
    params.permit(:description, :body, :name, :public)
 end
 private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

  def authorize_user
    #require("pry-rails"); binding.pry
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end

  def authorize_moderator
    #require("pry-rails"); binding.pry
    unless current_user.admin? || current_user.moderator?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end
end
