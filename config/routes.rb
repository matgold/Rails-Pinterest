Rails.application.routes.draw do
  
  resources :pins do
    resources :comments, except: [:index, :show, :new]
  end
  
  devise_for :users
  root 'pins#index'
  
  get 'home/about'
  get 'home/index'
  
end
