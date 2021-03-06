Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  # root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  devise_scope :user do
    get "complete", :to => "users/registrations#complete"
  end

  root 'items#index'
  resources :credit_cards, only: [:index, :new, :create, :show, :destroy]
  resources :logouts, only: [:index]
  resources :users, only: [:index]
  resources :categories, only: :index
  resources :items do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end

    member do
      get 'buy'
      get 'purchased'
      post 'purchase'

    end

    resources :messages, only: [:create, :destroy, :new] 
  end

  resources :buys, only: [:index]
    

end