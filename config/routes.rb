Photography::Application.routes.draw do

  resources :albums

  namespace :admin do resources :users end

  namespace :admin do resources :productions end
  namespace :admin do resource :session end   
  namespace :admin do resources :messages end
  namespace :admin do resources :photos do
      new do
       get :no_album
     end
    end
  end
  namespace :admin do
   resources :albums do
      member do
        get :add_photo
        post :create_photo
        post :remove_photo
     end

     resources :photos
   end
   end


  match '/admin/photos/:id/update' => 'admin/photos#update'

  match 'brand' => 'welcome#brand', :as => :brand  
  match 'team' => 'welcome#team', :as => :team
  match 'contact' => 'welcome#contact', :as => :contact 
  resources :photos do
     member do
        get 'next' 
        get 'prev'
     end
  end
  resources :weddings
  resources :arts   
  resources :messages    
  resources :productions
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  match 'admin' => 'admin/welcome#index', :as => :admin

  match 'admin/login' => 'admin/sessions#new', :as => :login
  match 'admin/login_out' => 'admin/sessions#destroy', :as => :login_out

  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
