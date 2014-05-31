Rails.application.routes.draw do
  get '/' => 'company/home#index', :constraints => { :subdomain => /.+/ }
  root :to => "home#index"
  
  devise_for :users, :controllers => { :sessions => 'sessions', :registrations => 'registrations' }
  
  resources :users
  
  get '/admin' => 'admin/home#index', :as => :admin_home
  
end
