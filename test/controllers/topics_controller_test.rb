require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:topic1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  test "should get new" do
    sign_in users(:user1)
    get :new
    assert_response :success
  end

  test "should create topic" do
    sign_in users(:user1)
    assert_difference('Topic.count') do
      post :create, topic: { title: @topic.title, user_id: @topic.user_id }
    end

    assert_redirected_to topic_path( assigns( :topic ) )
  end

  test "should show topic" do
    get :show, id: @topic
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user1)
    get :edit, id: @topic
    assert_response :success
  end

  test "should update topic" do
    sign_in users(:user1)
    patch :update, id: @topic, topic: { title: @topic.title, user_id: @topic.user_id }
    assert_redirected_to topic_path(assigns(:topic))
  end

  test "should destroy topic" do
    sign_in users(:user1)
    assert_difference('Topic.count', -1) do
      delete :destroy, id: @topic
    end

    assert_redirected_to topics_path
  end
end