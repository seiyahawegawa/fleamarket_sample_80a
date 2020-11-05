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

  root 'items#index'
  resources :credit_cards, only: [:index, :new, :create, :show] 
  resources :logouts, only: [:index]
  resources :categories, only: :index
  resources :items, only: [:index, :show, :new, :edit, :destroy, :create, :update] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
end