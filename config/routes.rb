Channels::Application.routes.draw do

  root :to => "home#index"

  match "/about" => "pages#about"
  match "/privacy" => "pages#privacy"
  match "/refund" => "pages#refund"

  resources :channels, :only => :show

  devise_for :users
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete '/logout' => 'devise/sessions#destroy'
    get '/logout' => 'devise/sessions#destroy'
    get '/signup' => 'devise/registrations#new'
  end

  #admin
  namespace :admin do
    root :to => "dashboard#index"
    get "dashboard/help"
    resources :channels
    resources :users, :only => :index
  end
end

