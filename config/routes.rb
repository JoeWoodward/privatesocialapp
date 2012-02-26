HarleyHealthVip::Application.routes.draw do

  match 'update-billing-detail' => 'your/users#update_billing_detail', :as => 'update_billing_details'
  match "complete-registration" => 'your/users#complete_registration', :as => 'complete_registration'
  match "register-now" => 'your/users#register_now', :as => 'register_now'
  match "updated-billing-info" => 'your/users#updated_billing_info', :as => 'updated_billing_info'
  match 'cancel-subscription' => 'your/users#cancel_subscription', :as => 'cancel_subscription'
  match 'resubscribe' => 'your/users#resubscribe', :as => 'resubscribe'

  resources :user_password_resets, :path => 'password-reset'

  match 'terms-and-conditions' => 'static_pages#terms', :as => 'terms_and_conditions'
  match 'privacy-policy' => 'static_pages#privacy', :as => 'privacy_policy'

  get 'ask-a-question' => 'ask_a_question#new', :as => 'ask_a_question'
  post 'ask-a-question' => 'ask_a_question#create'

  get "/offers" => 'offers#index', :as => 'offers'
  get "/offers/images" => 'offers#images', :as => 'offer_images'
  get "/offers/our-partners" => 'offers#partners', :as => 'partners'

  get 'faqs' => 'faqs#index', :as => 'faqs'

  resources :notices, :only => [:index, :show], :path => 'noticeboard'

  # events routes
  get 'events' => 'events#index', :as => 'events'
  get 'events/:id' => 'events#show', :as => 'event'
  get 'events/:id/rsvp' => 'events#rsvp', :as => 'rsvp_event'
  get 'events/:id/cancel-rsvp' => 'events#cancel_rsvp', :as => 'cancel_event_rsvp'

  # session path for logging out, the login form is within the home page ( static_pages )
  post 'login' => 'sessions#create', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  resources :sessions

  # root to the the public info page, also contains a login and sign up form
  root to: 'static_pages#home'

  # users routes
  match 'sign-up' => "your/users#new", :as => 'sign_up'
  match '/your/details/new' => redirect('/sign-up')
  # your_detailss for the plural as it's only used in a form (create and update)
  post 'your/details' => 'your/users#create', :as => 'your_detailss'
  get 'your/details/edit' => 'your/users#edit', :as => 'edit_your_details'
  get 'your/details' => 'your/users#show', :as => 'your_details'
  put 'your/details/:id' => 'your/users#update', :as => 'your_detailss'
  get 'your/events/:id/cancel-rsvp' => 'your/events#cancel_rsvp', :as => 'cancel_your_event_rsvp'

  namespace :your do
    root :to => redirect('/your/details')
    resources :notices
    resources :events, :only => [:index, :show]
  end


  namespace :admin do
    root :to => redirect("/admin/accounts")

    # session paths for admin
    match 'login' => 'sessions#new', :as => 'login'
    get 'logout' => 'sessions#destroy', :as => 'logout'
    resources :sessions

    resources :admin_password_resets, :path => 'password-reset', :as => 'password_resets'

    #resources for admin notices
    resources :notices, :only => [:show, :index, :destroy]

    resources :events

    resources :accounts, :controller => 'admins'

    resources :faqs

    resources :offers, :except => :destroy

    resources :vip_users, :path => 'vip-members', :only => [:index, :show]

    resources :partners
  end

  namespace 'chargify' do
    match '/hooks' => "hooks#dispatch_handler", :via => "post"
  end
end
