Channels::Application.routes.draw do

  resources :channels

  root :to => "home#index"

  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/signup' => 'devise/registrations#new'
  end
  resources :users, :only => :show

  #admin
  namespace :admin do
    root :to => "dashboard#index"
    get "dashboard/help"
    resources :channels
  end
end
