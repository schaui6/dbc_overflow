Rails.application.routes.draw do
  get 'welcome/index'

  resources :users
  resources :votes

  resources :questions do
    resources :answers
  end

  resources :questions do
    resources :comments
  end
  
  resources :answers do
    resources :comments
  end

  resources :sessions

  root 'welcome#index'
end
