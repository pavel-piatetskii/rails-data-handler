Rails.application.routes.draw do
  root to: 'update#index'
  get 'update/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
