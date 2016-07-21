Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :bookmarks
  end

  post :incoming, to: 'incoming#create'
  
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
