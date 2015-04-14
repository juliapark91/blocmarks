require 'test_helper'

class IncomingControllerTest < ActionController::TestCase
 
  def setup
    @params = { 'sender': 'someone@example.com',
                'subject': 'top tech to watch in 2015', 
                'body-plain': 'http://www.top-tech.com' }
  end
  
  test 'should create a new bookmark' do
    assert_difference( 'Bookmark.count', 1 ) do
      post :create, @params
    end
  
    assert_response :success
  end
  
  test 'should create a new user if it does not exist' do
    assert_difference( 'User.count', 1 ) do
      post :create, @params
    end
  
    assert_response :success
  end
  
  test 'should create a new topic if it does not exist' do
    assert_difference( 'Topic.count', 1 ) do
      post :create, @params
    end
  
    assert_response :success
  end
 
end
