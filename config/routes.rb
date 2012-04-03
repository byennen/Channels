Channels::Application.routes.draw do
  #subdomains
  match "", to: "channels#show", constraints: lambda {|r| r.subdomain.present? && r.subdomain != 'www'}

  #static pages
  match "/about" => "pages#about"
  match "/privacy" => "pages#privacy"
  match "/refund" => "pages#refund"

  #giveaways
  match "/kentucky-derby-with-randy-owen" => "giveaways#derby", :as => "derby"
  match "/cma-fanfest-with-randy-owen" => "giveaways#cma", :as => "cma"
  match "/thank-you" => "giveaways#thankyou", :as => "thankyou"

  #giveaways email
  match "/create_derby(/:id)" => "giveaways#create_derby"
  match "/create_cma(/:id)" => "giveaways#create_cma"

  #channels
  resources :channels, :only => :show

  #users
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
    resources :channels do
      resources :songs
      resources :features, :only => :edit
    end
    resources :features, :only => :update
    resources :songs
    resources :users, :only => :index
  end

  root :to => "home#index"

end
