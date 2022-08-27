Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/tagged', to: "lawfirms#tagged", as: :tagged
  get '/profile', to: "profile#profile"
  get '/about', to: "pages#about"

  resources :consultations, only: [ :index, :show, :destroy, :edit, :update ]

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
    resources :consultations, only: :update
    member do
      post 'toggle_favorite', to: "lawfirms#toggle_favorite"
    end
  end

  namespace :lawyer do
    resources :consultations, only: [ :index, :show, :update ]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
