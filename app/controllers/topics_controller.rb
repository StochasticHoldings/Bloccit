class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end
  def show
  @topic = Topic.find(params[:id])
end
def new
     @topic = Topic.new
end

def create
     @topic = Topic.new
     @topic.name = params[:topic][:name]
     @topic.description = params[:topic][:description]
     @topic.public = params[:topic][:public]



     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
   end


   def edit
  @topic = Topic.find(params[:id])
end
def update
    @topic = Topic.find(params[:id])

    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]

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
end
