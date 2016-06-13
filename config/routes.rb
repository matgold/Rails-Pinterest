Rails.application.routes.draw do
  
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
    resources :comments, except: [:index, :show, :new]
  end
  
  devise_for :users
  
  resources :tags
  
  root 'pins#index'
  
  get 'home/about'
  get 'home/index'
  
end
