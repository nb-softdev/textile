Rails.application.routes.draw do

  get '/' => 'company/home#index', :constraints => { :subdomain => /.+/ }
  constraints DomainConstraint.new('textile.com') do
    root :to => 'home#index', :as => :home
  end
  root :to => "company/home#index", :as => :company_home
  
  
  devise_for :users, :controllers => { :sessions => 'sessions', :registrations => 'registrations', :passwords => 'passwords' }
  
  resources :users
  
  get '/admin' => 'admin/home#index', :as => :admin_home
  namespace :admin do
    resources :categories, :markets, :work_types, :contact_us, :products, :companies, :users
    resources :albums do
      resources :album_products
    end
    #resources :albums do
     # collection do
      #  get :products
      #end
    #end
  end
  
  namespace :company do
		resources :albums
    namespace :admin do
      resources :contact_us, :products, :companies
      get '/home' => 'home#index', :as => :home
      resources :company_work_types do
        get :autocomplete_work_type_name, :on => :collection
      end
      resources :albums do
        resources :album_products
      end      
    end
    get '/photos/:type/:id' => 'home#photos', :as => :photos
  end
  
  #get '/albums' => 'company/albums#index', :as => :albums
  
  get '/company_not_found' => 'no_company#company_not_found', :as => :company_not_found
  post '/contact_us_save' => 'home#contact_us_save', :as => :contact_us_save
  
end
