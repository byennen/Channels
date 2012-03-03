Channels::Application.routes.draw do

  get "users/index"

  get "/about" => "pages#about"
  get "/privacy" => "pages#privacy"
  get "/refund" => "pages#refund"

  resources :channels

  root :to => "home#index"

  devise_for :users do
    get '/login' => 'devise/sessions#new'
  end

  as :user do
    get "/login" => "devise/sessions#new"
    get '/logout' => 'devise/sessions#destroy'
    delete '/logout' => 'devise/sessions#destroy'
    get '/signup' => 'devise/registrations#new'
  end
  resources :users, :only => :show

  #admin
  namespace :admin do
    root :to => "dashboard#index"
    get "dashboard/help"
    resources :channels
    resources :users, :only => :index
  end
end
