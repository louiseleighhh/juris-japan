Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :consultations, only: [ :index, :show, :destroy ]

  resources :procedures, only: [ :index, :show ] do
    resources :consultations, only: [:new, :create]
  end

  resources :steps, only: [ :show, :edit, :update ] do
    resources :items, only: [ :show, :edit, :update ]
  end

  resources :lawfirms, only: [ :index, :show ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/tagged', to: "lawfirms#tagged", as: :tagged
  get '/profile', to: "profile#profile"
  get '/about', to: "pages#about"
end
