class IncomingController < ApplicationController

#   # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Check if user is nil, if so, create and save a new user
    email = params[:sender]
    name = "John Doe"
    #user_params = params.require(:user).permit(:name, :password, :password_confirmation, email: email)
    
    if email
      user = User.find_by( email: email )
      if user.nil?
        user = User.new(name: name , email: email, password: "helloworld", password_confirmation: "helloworld") 
        user.skip_confirmation!
        user.save!
      end
    end
    
    # # Check if the topic is nil, if so, create and save a new topic
    # title = params[:subject]
    # if user && title
    #   topic = user.topics.find_or_create_by( title: title )
    # end 

    # # Now that you're sure you have a valid user and topic, build and save a new bookmark 
    # url = params["body-plain"]
    # if user && topic && url
    #   bookmark = Bookmark.create(url: url, topic: topic)
    # end

    head 200
  end

end