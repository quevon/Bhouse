Rails.application.routes.draw do
  resources :properties
  devise_for :owners
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :tenants

  patch 'admin/owners/:id/active', to: 'owners#active', as: 'active_owner'
  patch 'admin/owners/:id/inactive', to: 'owners#inactive', as: 'inactive_owner'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :properties, only: [:index, :show, :create, :destroy]
    end
  end

  resources :conversations do
    resources :messages
  end

  root to: "home#index"
end
  