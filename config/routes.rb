Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  root to: 'homes#top'
  get '/about' => 'homes#about'

  post '/orders/confirm' => 'customers/orders#confirm'
  get '/orders/finish' => 'customers/orders#finish'
  delete "/cart_product/destroy_all" => "customers/cart_products#destroy_all"

  scope module: :customers do
    resources :products, only: [:show, :index]
    resource :customers, only:[:show]
    resources :receivers
    resource :orders, only:[:new, :create]
    resources :orders, only:[:index, :show]
    resources :cart_products, only: [:index, :create, :update, :destroy]
  end

  get '/customers/unsubscribe' => 'customers/customers#unsubscribe'
  patch '/customers/withdraw' => 'customers/customers#withdraw'


  namespace :admins do
    resources :products, except: [:destroy]
    resources :product_types, except: [:new, :show, :destroy]
    resources :customers, except: [:new,:create,:destroy]
    resources :orders, only: [:index,:show,:update]
    resources :ordered_products, only: [:update]
  end

end
