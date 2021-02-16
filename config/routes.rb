Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  
  scope module: :public do
    resources :products, only: [:show, :index]
  end

  namespace :admin do
    resources :products, except: [:destroy]
    resources :product_types, except: [:new, :show, :destroy]
  end

end
