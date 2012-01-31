Channels::Application.routes.draw do
  resources :channels

  root :to => "home#index"

  devise_for :users
  resources :users, :only => :show

  #admin
  namespace :admin do
    root :to => "dashboard#index"
    get "dashboard/help"
    resources :channels
  end


end
