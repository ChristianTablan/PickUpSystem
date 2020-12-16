Rails.application.routes.draw do

  get 'upcomings/show'
  devise_for :administrators

  devise_scope :administrator do
  authenticated :administrator do
    root 'upcomings#show', as: :authenticated_root
  end

  unauthenticated do
    root 'shops#index', as: :unauthenticated_root
  end
end

  get 'carts', to: 'carts#show'
  resources :products
  resources :shops, only:[:index, :show]
  resources :order_items
  resource :carts, only:[:show]

  #root 'shops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
