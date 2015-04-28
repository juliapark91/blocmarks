class UsersController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmarks = @topic.bookmarks
    #@bookmark = @topic.bookmarks.find(params[:bookmark_id])
    #@like = Like.find(bookmark: @bookmark)
  

    @user_bookmarks = @topic.bookmarks.where(user_id: current_user.id)
    #@liked_bookmarks
  end
end
