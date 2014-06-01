Rails.application.routes.draw do
  get '/' => 'company/home#index', :constraints => { :subdomain => /.+/ }
  root :to => "home#index"
  
  devise_for :users, :controllers => { :sessions => 'sessions', :registrations => 'registrations' }
  
  resources :users
  
  get '/admin' => 'admin/home#index', :as => :admin_home
  
  namespace :admin do
    resources :categories, :markets, :work_types, :contact_us, :products, :companies
    
    #resources :companies do
     # collection do
      #  get :products
      #end
    #end
  end
  
  namespace :company do
    resources :contact_us, :products
  end  
  
end
