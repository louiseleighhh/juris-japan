Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/tagged', to: "lawfirms#tagged", as: :tagged
  get '/profile', to: "profile#profile"
  get '/about', to: "pages#about"

  resources :consultations, only: [ :index, :show, :destroy ]

  resources :procedures, only: [ :index, :show ] do
    resources :consultations, only: [:new, :create]
  end

  resources :steps, only: [ :show, :edit, :update ]

  resources :items, only: [ :show, :edit, :update ] do
    member do
      delete :delete_photo_attachment
    end
  end

  resources :lawfirms do
    resources :reviews, only: :create
  end

  namespace :lawyers do
    resources :consultations, only: [ :index, :show, :update ]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
