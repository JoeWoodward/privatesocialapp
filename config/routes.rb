HarleyHealthVip::Application.routes.draw do

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

  #  users routes
  match 'sign-up' => "account/users#new", :as => 'sign_up'

  namespace :account do

    #       account_path        /account(.:format)          account/users#show
    #   edit_account_path       /account/edit               account/users#edit
    #    account_notices GET    /account/notices(.:format)  account/notices#index
    #                    POST   /account/notices(.:format)  account/notices#create
    root to: 'users#show', :as => ''
    get 'edit' => 'users#edit', :as => 'edit'
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
  end
end
