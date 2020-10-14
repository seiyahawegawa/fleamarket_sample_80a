Rails.application.routes.draw do
  root  'credit_cards#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :credit_cards, only: [:index, :new, :create, :show] do
  end
    
end
