Phoenix::Application.routes.draw do

 resources :product_types do
    resources :product_cataloges
  end

#  devise_for :admins

  resources :privacy
  resources :transactions
  resources :aboutus
  resources :recruit
  resources :faq
  resources :registsuccess
  resources :copyright
  resources :benefit

  match "products/find_title" => "products#find_title"
  match "/products/borrow" => "products#borrow"
  match "/products/update_cata_level_2" => "products#update_cata_level_2"
  match "/products/search" => "products#search"
  resources :products do
  resources :DataFiles
  end

  resources :customers

  devise_for :users do
  match 'logout' => 'devise/sessions#destroy'
  end

  get "home/index"

  match "/upload" => "upload#index"
  match "/upload/uploadFile" => "upload#uploadFile"
  match "/delete/datafile" => "DataFile#destroy"

   root :to => "home#index"
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
