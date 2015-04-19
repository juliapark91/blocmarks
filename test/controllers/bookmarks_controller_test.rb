require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  setup do
    @bookmark = bookmarks( :bookmark1 )
  end

  test "should get new" do
    sign_in users( :user1 )

    get :new, topic_id: @bookmark.topic_id
    assert_response :success
  end
  
  # test "should create bookmark" do
  #   sign_in users( :user1 )
  #
  #   assert_difference('Bookmark.count') do
  #     post :create, bookmark: { topic_id: @bookmark.topic_id, url: @bookmark.url }
  #   end
  #
  #   assert_redirected_to bookmark_path(assigns(:bookmark))
  # end
  #
  # test "should show bookmark" do
  #   get :show, id: @bookmark
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   sign_in users( :user1 )
  #
  #   get :edit, id: @bookmark
  #   assert_response :success
  # end
  #
  # test "should update bookmark" do
  #   sign_in users( :user1 )
  #
  #   patch :update, id: @bookmark, bookmark: { topic_id: @bookmark.topic_id, url: @bookmark.url }
  #   assert_redirected_to bookmark_path(assigns(:bookmark))
  # end
  #
  # test "should destroy bookmark" do
  #   sign_in users( :user1 )
  #
  #   assert_difference('Bookmark.count', -1) do
  #     delete :destroy, id: @bookmark
  #   end
  #
  #   assert_redirected_to bookmarks_path
  # end
end
