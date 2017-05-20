Rails.application.routes.draw do

  resources :albums
    root 'welcome#index'

end
