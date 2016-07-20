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
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Topic saved successfully"
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Failed to save topic"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      flash[:notice] = "Topic Updated"
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Failed to update Topic"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "Topic Deleted"
      redirect_to topics_path
    else
      flash[:alert] = "Failed to delete topic"
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
