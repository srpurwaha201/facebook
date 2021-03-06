Rails.application.routes.draw do
  resources :application do
  get :autocomplete_user_full_name, :on => :collection
  end
  post 'likes/toggle_like'

  resources :user, only: [:show]
  resources :comments, only: [:create, :destroy, :edit, :update]
  resources :posts, only: [:create, :destroy, :edit, :update]
  get 'home/index'

  root 'home#index'

  get 'users' => 'home#users'

  post 'user/newRequest'

  post 'user/acceptRequest'
  post 'user/declineRequest'

  get 'home/requests'

  get 'friends' => 'home#friends'
  get 'profile' => 'home#profile'

  post 'user/unFriend'
  post 'home/upload_image'

  get 'user/profile_pic_path'

  get 'user_api/feed'

  post 'posts_api/create'
  post 'comments_api/create'
  post 'user_api/sign_in'

  post 'posts_api/delete'

  post 'user_api/sign_up'

  get 'user/profile'

  devise_for :users, :controllers => { registrations: 'registrations' }
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
