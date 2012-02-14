HarleyHealthVip::Application.routes.draw do

  get "/offers" => 'offers#index', :as => 'offers'

  get 'faqs' => 'faqs#index', :as => 'faqs'

  resources :notices, :only => [:index, :show]

  # events routes
  get 'events' => 'events#index', :as => 'events'
  get 'events/:id' => 'events#show', :as => 'event'

  # session path for logging out, the login form is within the home page ( static_pages )
  post 'login' => 'sessions#create', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  resources :sessions

  # root to the the public info page, also contains a login and sign up form
  root to: 'static_pages#home'

  # users routes
  match 'sign-up' => "your/users#new", :as => 'sign_up'
  post 'your/details' => 'your/users#create', :as => 'your_details'
  get 'your/details/edit' => 'your/users#edit', :as => 'edit_your_details'
  get 'your/details' => 'your/users#show', :as => 'your_details'
  put 'your/details' => 'your/users#update'

  namespace :your do
    root :to => redirect('/your/details')
    resources :notices
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

    resources :faqs

    resources :offers, :except => :destroy
  end
end
