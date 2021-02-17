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


  scope module: :customers do
    resources :products, only: [:show, :index]
  end

  namespace :admins do
    resources :products, except: [:destroy]
    resources :product_types, except: [:new, :show, :destroy]
  end


  scope module: :customers do
    resource :customers, only:[:show]
  end
  get '/customers/unsubscribe' => 'customers/customers#unsubscribe'
  patch '/customers/withdraw' => 'customers/customers#withdraw'

end
