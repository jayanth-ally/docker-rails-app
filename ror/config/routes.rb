Rails.application.routes.draw do
  resources :attachments, only: [:index, :new, :create, :destroy]   

  root 'attachments#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
