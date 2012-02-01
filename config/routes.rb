HarleyHealthVip::Application.routes.draw do
  root :to => 'static_pages#home'

  match '/sign-up' => "users#new", :as => 'sign_up'
  match '/account/details' => 'users#show', :as => 'account_details'

  resources :users
end
