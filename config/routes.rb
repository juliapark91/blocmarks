Rails.application.routes.draw do
  resources :topics do
    resources :bookmarks, except: [:index]
  end

  devise_for :users
  get "welcome/index"
  post '/incoming', to: 'incoming#create'
  
  root to: 'welcome#index'

end
