Rails.application.routes.draw do
  get 'cost' => 'cost#index'
  #root 'cost#index'

  
  resources :shippings
  resources :costs
  resources :destinations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
