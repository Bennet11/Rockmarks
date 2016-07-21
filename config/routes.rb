Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :bookmarks
  end

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:index, :create, :destroy]
  end

  post :incoming, to: 'incoming#create'

  get 'welcome/index'

  get 'welcome/about'

  get 'likes/index'

  root 'welcome#index'
end
