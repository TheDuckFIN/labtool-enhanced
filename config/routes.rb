Rails.application.routes.draw do
  resources :users
  resources :courses do
    get 'join', on: :member
    delete 'leave', on: :member
    get 'codereviews', on: :member
    get 'review_students', on: :member
    get 'manage_weeks', on: :member
    post 'advance_week', on: :member
    post 'add_teacher', on: :member

    resources :weeks, only: [:edit]
    resources :weekly_submissions, only: [:new, :edit, :create, :update]
  end

  resources :weeks, only: [:update]

  resources :participations, only: [:create, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]

  get 'home', to: 'homepages#index'
  get 'login', to: 'sessions#new'
  get 'register', to: 'users#new'

  root 'homepages#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
