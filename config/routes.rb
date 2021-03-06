Rails.application.routes.draw do

  get 'sessions_admin/new'

  get 'sessions/new'

  get 'welcome/index'
  get 'aboutus', to: 'welcome#aboutus', as: :aboutus
  get 'aboutproject', to: 'welcome#project', as: :aboutproject
  get 'weekend', to: 'welcome#hello', as: :hello
  get 'bienvenido', to: 'welcome#start', as: :bienvenido

  get 'home' => 'welcome#hello'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get    'login_adm'   => 'sessions_admin#new'
  post   'login_adm'   => 'sessions_admin#create'
  delete 'logout_adm'  => 'sessions_admin#destroy'



  resources :places do
    member do
      resources :favorites, only: [:create]
      delete '/favorites/:favorite_id', to: 'favorites#destroy', as: :favorite
    end
  end
  resources :admins
  resources :moods do
    member do
      get 'places',to: 'moods#places'
    end
  end
  resources :categories do
    member do
      get 'places',to: 'categories#places'
    end
  end

  resources :users do
    member do
      get 'places',to: 'users#places'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#hello'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
