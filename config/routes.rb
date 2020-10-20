Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
    root 'items#index'

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  # root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end