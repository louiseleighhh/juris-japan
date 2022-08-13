Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :consultations, only: [ :index, :show ]

  resources :procedures, only: [ :index, :show ] do
    resources :consultations, only: [:new, :create]
  end

  resources :steps, only: [ :show, :edit, :update ]
  resources :lawfirms, only: [ :index, :show ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/tagged', to: "lawfirms#tagged", as: :tagged
  get "/profile", to: "pages#profile"
end
