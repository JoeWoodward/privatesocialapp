HarleyHealthVip::Application.routes.draw do

  resources :notices, :only => [:index, :show]

  # events routes
  get 'events' => 'events#index', :as => 'events'
  get 'events/:id' => 'events#show', :as => 'event'

  # session path for logging out, the login form is within the home page ( static_pages )
  post 'login' => 'sessions#create', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  resources :sessions

  # root to the the public info page, also contains a login and sign up form
  root :to => 'static_pages#home'

  #  users routes
  match 'sign-up' => "accounts/users#new", :as => 'sign_up'

  namespace :account do
    resources :notices
    resources :details, :controller => 'users', :except => [:index, :destroy]
  end


  namespace :admin do
    root :to => redirect("/admin/accounts")

    # session paths for admin
    match 'login' => 'sessions#new', :as => 'login'
    get 'logout' => 'sessions#destroy', :as => 'logout'
    resources :sessions

    #resources for admin notices
    resources :notices, :only => [:show, :index, :destroy]

    resources :events

    resources :accounts, :controller => 'admins'
  end
end
