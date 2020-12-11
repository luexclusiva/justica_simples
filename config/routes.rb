Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :judicials, only: %i[index show]
  resources :user_judicials, only: %i[create destroy index]
end
