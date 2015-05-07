class UsersController < ApplicationController
  def show
    @topics = Topic.all
    
    # @user_bookmarks = current_user.bookmarks
    # @user_likes = current_user.likes
  end
end
