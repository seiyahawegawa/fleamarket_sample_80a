Rails.application.routes.draw do 
  root 'items#index'
  resources :credit_cards, only: [:index, :new, :create, :show] 
  resources :logouts, only: [:index]
  resources :categories, only: :index
  resources :items, only: [:index, :show, :new, :edit, :destroy, :create] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
end