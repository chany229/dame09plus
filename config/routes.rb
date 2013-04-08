Dame09plus::Application.routes.draw do

  namespace :admin do
    resources :games
  end


  get "comments/index"

  devise_for :users

  get "admin" => "admin#index", :as => :admin
  post "admin/setting", :as => :setting

  namespace :admin do
    resources :articles
    resources :entries
    resources :comments, :only => [:index]
  end
  match 'detail(.:format)' => 'public#detail', :as => :detail
  match 'top(.:format)' => 'public#top', :as => :top
  
  match 'logs(/p:page)(.:format)' => 'public#logs', :as => :logs
  match 'games(/p:page)(.:format)' => 'public#games', :as => :games
  match 'game/:id(.:format)' => 'public#game', :as => :game
  
  match 'date/:year(/p:page)(.:format)' => 'public#date',:as => :year
  match 'date/:year/:month(/p:page)(.:format)' => 'public#date',:as => :month
  match 'date/:year/:month/:day(/p:page)(.:format)' => 'public#date',:as => :day

  match 'calendar/:datetime(.:format)' => 'public#calendar', :as => :calendar
  match 'tag/:tag(/p:page)(.:format)' => 'public#tag', :as => :tag
  match 'keyword(/:keyword)((/p:page).:format)' => 'public#keyword', :as => :keyword
  
  match 'change_format' => "public#change_format", :as => 'change_format'
  post 'create_comment' => "public#create_comment", :as => 'create_comment'
  
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
  root :to => 'public#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
