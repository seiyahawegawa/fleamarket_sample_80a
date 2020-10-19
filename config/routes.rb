Rails.application.routes.draw do
  root 'items#index'
  resources :categories, only: :index
  resources :items, only: [:index, :show, :new, :edit, :create, :destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
end


