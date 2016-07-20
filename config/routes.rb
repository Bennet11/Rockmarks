Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :bookmarks, only: [:show, :new, :edit]
  end

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
