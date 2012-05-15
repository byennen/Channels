Channels::Application.routes.draw do

  #subdomains - Keep at top
  match "", to: "channels#show", constraints: lambda {|r| r.subdomain.present? && r.subdomain != 'www'}

  #static pages
  match "/about" => "pages#about"
  match "/privacy" => "pages#privacy", :as => "privacy"
  match "/refund" => "pages#refund", :as => "refund"
  match "/terms" => "pages#terms", :as => "terms"
  match "/copyrights" => "pages#copyrights", :as => "copyrights"
  match "/randy-owen-altimarc-coming-soon-video" => "pages#randy_owen_coming_soon_video", :as => "randy_owen_video"

  #giveaways
  match "/giveaways/kentucky-derby-with-randy-owen" => "giveaways#derby", :as => "derby"
  match "/kentucky-derby-with-randy-owen" => redirect("/giveaways/kentucky-derby-with-randy-owen")
  match "/giveaways/cma-fanfest" => "giveaways#cma", :as => "cma"
  match "/cma-fanfest-with-randy-owen" => redirect("/giveaways/cma-fanfest")
  match "giveaways/thank-you" => "giveaways#thankyou", :as => "thankyou"

  #giveaways email
  match "/create_derby(/:id)" => "giveaways#create_derby"
  match "/create_cma(/:id)" => "giveaways#create_cma"

  #channels
  resources :channels, :only => :show do
    get :next_song, :on => :collection
  end

  resources :songs, :only => :show do
    get :next_song, :on => :collection
  end

  #users
  devise_for :users #, :controllers => {:registrations => 'registrations', :sessions => 'sessions'}
  devise_scope :user do
    get "/login" => "sessions#new"
    delete '/logout' => 'sessions#destroy'
    get '/logout' => 'sessions#destroy'
    get '/signup' => 'registrations#new'
  end

  #admin - Clean up!
  namespace :admin do
    root :to => "dashboard#index"
    get "dashboard/help"
    resources :channels do
      resources :features, :only => :edit
      resources :photos
      resources :videos
      resources :albums do
        resources :songs
      end
    end
    resources :features, :only => :update
    resources :photos, :only => :index
    resources :videos, :only => :index
    resources :albums, :only => :index
    resources :users
  end

  root :to => "home#index"

end
