Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update, :destroy] do
        member do
          post :logout
        end
        resources :profiles, only: [:create, :update]
        resources :resumes, only: [:create, :update]
        resources :job_applications, only: [:create, :update, :index]
        resources :addresses, only: [:create, :update, :destroy]
      end
      resources :jobs, only: [:index, :show, :create, :update, :destroy]
      post '/login', to: 'users#login'
      post '/forgot_password', to: 'users#forgot_password'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end
