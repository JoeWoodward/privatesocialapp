HarleyHealthVip::Application.routes.draw do
  # session path for logging out, the login form is within the home page ( static_pages )
  post 'login' => 'sessions#create', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  resources :sessions

  # root to the the public info page, also contains a login and sign up form
  root :to => 'static_pages#home'

  #  users routes
  match 'sign-up' => "users#new", :as => 'sign_up'
  resources :accounts, :controller => 'users'


  namespace :admin do
    root :to => redirect("/admin/accounts")

    # session paths for admin
    match 'login' => 'sessions#new', :as => 'login'
    get 'logout' => 'sessions#destroy', :as => 'logout'
    resources :sessions

    #resources for admin notices
    resources :notices

    resources :accounts, :controller => 'admins'
  end
end
