Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :consultations
  resources :procedures, only: [ :index, :show ]
  resources :steps, only: [ :edit, :update ]
  resources :lawfirms, only: [ :index, :show ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/tagged', to: "lawfirms#tagged", as: :tagged
end
