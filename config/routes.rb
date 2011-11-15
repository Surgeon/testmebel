Catalog::Application.routes.draw do

  

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  match "city/search_results" => "city#search_results"


  match "articles/" => 'article#index'

  match "article/show/:id" => 'article#show'

  match "article/news_articles" => 'article#news_articles'

  get 'about(.:format)' => 'static_page#about'

  get 'contacts(.:format)' => 'static_page#contacts'
  

  devise_for :users

  root :to => 'region#index'

  match 'company/update_show/:id(.:format)' => 'company#update_show'

  post 'company/:friendly_url/:id/contact/' => 'company#contact'

  get 'company/:friendly_url/:id/contact/' => 'company#contact'

  post 'company/:friendly_url/:id/renew/' => 'company#renew'

  get 'company/:friendly_url/:id/renew/' => 'company#renew'

  match "company/:friendly_url/:id(.:format)" => 'company#show' , :as => 'company'

  get 'company/add_company' => 'company#add_company'

  post 'company/add_company' => 'company#add_company'

  match 'company/update_index' => 'company#update_index'

  match 'company/update_show/:id' => 'company#update_show'


  match 'city/:friendly_url/:category(.:format)' => 'city#show'

  match 'city/:friendly_url(.:format)' => 'city#show'


  match 'news/' => 'news_item#index'

  match 'news/:id(.:format)' => 'news_item#show'


  match '/:friendly_url(.:format)' => 'region#show'






  #match 'company/:id' => 'company#show'
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
