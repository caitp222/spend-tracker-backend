Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show] do
    resources :categories, only: [:create, :update, :delete]
    resources :money_records, only: [:index, :create, :update, :show, :delete]
  end

end
