Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

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
    
    #resources :companies do
     # collection do
      #  get :products
      #end
    #end
  end
  
  
  namespace :company do
    namespace :admin do
      resources :contact_us, :products, :companies
      get '/home' => 'home#index', :as => :home
      
      resources :company_work_types do
        get :autocomplete_work_type_name, :on => :collection
      end
      
    end  
  end
  
  get '/company_not_found' => 'no_company#company_not_found', :as => :company_not_found
  
end
