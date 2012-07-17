Channels::Application.routes.draw do
  #subdomains - Keep at top
  #static pages
  match "about" => "pages#about"
  match "jobs" => "pages#jobs"
  match "our_team" => "pages#our_team", :as => "our_team"
  match "press" => "pages#press"
  match "faq" => "pages#faq"
  match "customer-support" => "pages#customer_support", :as => "customer_support"
  match "safe-harbor" => "pages#safe_harbor", :as => "safe_harbor"
  match "altimarc-for-your-business" => "pages#altimarc_for_your_business", :as => "altimarc_for_your_business"
  match "privacy" => "pages#privacy", :as => "privacy"
  match "refund" => "pages#refund", :as => "refund"
  match "terms" => "pages#terms", :as => "terms"
  match "copyrights" => "pages#copyrights", :as => "copyrights"
  match "randy-owen-altimarc-coming-soon-video" => "pages#randy_owen_coming_soon_video", :as => "randy_owen_video"

  #giveaways
  match "giveaways/kentucky-derby-with-randy-owen" => "giveaways#derby", :as => "derby"
  match "kentucky-derby-with-randy-owen" => redirect("/giveaways/kentucky-derby-with-randy-owen")
  match "giveaways/cma-fanfest" => "giveaways#cma", :as => "cma"
  match "cma-fanfest-with-randy-owen" => redirect("/giveaways/cma-fanfest")
  match "giveaways/thank-you" => "giveaways#thankyou", :as => "thankyou"

  #giveaways email
  match "/create_derby(/:id)" => "giveaways#create_derby"
  match "/create_cma(/:id)" => "giveaways#create_cm:wa"

  post "zencoder-callback" => "zencoder_callback#create", :as => "zencoder_callback"

  #channels
  resources :giveaways, :only => [:index]
  resources :videos, :only => [:show, :index]
  match "/music" => "music#index", :as => "music"
  resources :photos, :only => [:show, :index]

  resources :channels, :only => [:show, :index] do
    get :next_song, :on => :collection
  end

  # Ads
  get "/ads/next" => "ads#next"

  resources :songs, :only => [:index, :show] do
    get :next_song, :on => :collection
    get :intro, :on => :collection
  end

  #users
  devise_for :users #, :controllers => {:registrations => 'registrations', :sessions => 'sessions'}
  devise_scope :user do
    get "/login" => "sessions#new"
    delete '/logout' => 'sessions#destroy'
    get '/logout' => 'sessions#destroy'
    get '/join' => 'registrations#new'
  end

  #match '/media/*dragonfly', :to => Dragonfly[:images]

  #admin
  namespace :admin do
    resources :features, :only => :update
    resources :photos, :only => :index
    resources :videos, :only => :index
    resources :albums, :only => :index
    resources :posts, :only => :index
    resources :users
    #match "channels/:channel_id/albums/:album_id/songs/create_song_upload" => "songs#create_song_upload", :via => [:post], :as => 'create_song_upload'

    #admin/channels
    resources :channels do
      resources :features, :only => :edit
      resources :photo_albums do
        resources :photos
      end
      resources :videos
      resources :posts
      resources :albums do
        resources :songs
      end
    end
    match "/pages/channels-help" => "pages#channel_help", :as => "channel_help"
    root :to => "dashboard#index"
  end


  root :to => "channels#show", constraints: lambda {|r| (r.subdomain.present? && r.subdomain != 'www') || !r.host.in?(%w(altimarc.com channels.dev localhost www.channels.dev altimarc-staging.com www.altimarc-staging.com))}
  root :to => "home#index"
end
