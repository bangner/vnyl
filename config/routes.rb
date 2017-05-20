Rails.application.routes.draw do

  devise_for :users
  resources :albums
    root 'welcome#index'

end
