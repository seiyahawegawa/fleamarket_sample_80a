Rails.application.routes.draw do
  root  'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :credit_cards, only: [:index, :new, :show] 
  resources :logouts, only: [:index] 

end
