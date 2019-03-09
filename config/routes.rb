Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show]
  resources :categories, only: [:create, :edit, :delete]
  resources :money_records, only: [:index, :create, :edit, :show, :delete]

end
