class LikesController < ApplicationController
  before_action :set_topic
  before_action :set_bookmark

  def create
    like = current_user.likes.build(bookmark: @bookmark)
    authorize @like
  
    if @like.save
      flash[:notice] = "Liked bookmark"
      redirect_to(:back)
    else
      flash[:error] = "Error liking bookmark"
      redirect_to(:back)
    end
  end

  def destroy
    @like = current_user.likes.where(bookmark_id: @bookmark.id, user_id: current_user.id).first
    authorize like

    if @like.destroy
      flash[:notice] = "Unliked bookmark"
    else
      flash[:error] = "Error unliking bookmark"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_bookmark
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
  end
end