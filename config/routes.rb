Rails.application.routes.draw do
  devise_for :users
  get "welcome/index"
  post '/incoming', to: 'incoming#create'
  
  root to: 'welcome#index'

end
