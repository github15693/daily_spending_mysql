Rails.application.routes.draw do
  # env['devise.mapping'] = Devise.mappings[:user]


  resources :friend_lists, :except=>[:index,:new,:show] do
    collection do
      get 'confirm_list'
      post 'confirm'
    end
  end

  resources :individual_chats, only: [:create] do
    collection do
      get 'open_chat_box'
    end
  end

  resources :group_chats

  resources :group_chat_lists

  resources :goods

  resources :roles

  resources :homes

  resources :users, only: [:index]

  resources :managements do
    collection do
      get 'add_goods'
      post 'update_expiry_date'
      post 'update_money_init'
    end
  end
  devise_for :users, :controllers => {:registrations =>
                                          "registrations", :confirmations => "confirmations", :sessions =>
                                          "sessions"}#, omniauth_callbacks: "omniauth_callbacks"
  devise_scope :user do
    get 'auth/:provider/callback'=> 'sessions#create_auth'
  end

  authenticated :user do
    root :to => 'homes#index', :as => :authenticated_root
  end

  root :to => redirect('/users/sign_in')


  # match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'sign_out', to: 'sessions#destroy', as: 'sign_out', via: [:get, :post]
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
