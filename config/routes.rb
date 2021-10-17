Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items
  scope '/admin' do
    resources :users
  end
  
  get '/orders/create', to: "orders#create"
  resources :orders, only: [:index, :new, :show]

end
