Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :create, :show, :edit, :update, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
