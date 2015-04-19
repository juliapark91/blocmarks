class BookmarksController < ApplicationController

  before_action :set_topic

  def show
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def new
    @bookmark = @topic.bookmarks.build
  end

  def create
    @bookmarks = @topic.bookmarks
    @bookmark = current_user.bookmarks.build( bookmark_params )

    if @bookmark.save
      redirect_to @bookmark, notice: "Bookmark was saved."
    else
      flash[:error] = "Error creating bookmark."
      render :new
    end
  end

  def edit
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

end
