Rails.application.routes.draw do
  
  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index]
  end
  
  get "welcome/index"
  post '/incoming', to: 'incoming#create'
  
  root to: 'welcome#index'

end
