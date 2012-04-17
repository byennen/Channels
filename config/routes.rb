Channels::Application.routes.draw do

  root :to => "home#index"

  match "/about" => "pages#about"

  match "/kentucky-derby-with-randy-owen" => "giveaways#derby", :as => "derby"
  match "/cma-fanfest-with-randy-owen" => "giveaways#cma", :as => "cma"
  match "/thank-you" => "giveaways#thankyou", :as => "thankyou"

  match "/create_derby(/:id)" => "giveaways#create_derby"
  match "/create_cma(/:id)" => "giveaways#create_cma"


  #resources :giveaways, :only => "create"

  # match "/privacy" => "pages#privacy"
  # match "/refund" => "pages#refund"

end

