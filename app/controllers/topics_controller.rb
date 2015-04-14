class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(params.require(:topic).permit(:title))
    
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(params.require(:topic).permit(:title))
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    title = @topic.title

    if @topic.destroy
      redirect_to topics_path, notice: "\"#{title}\" was deleted successfully."
    else
      flash[:error] = "Error deleting topic. Please try again."
      render :show
    end
  end

end
