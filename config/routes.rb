require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :admin_users, path: 'admin'
  authenticate :admin_user do
    namespace :admin do
      mount Sidekiq::Web => '/sidekiq'

      get '/', to: 'static#dashboard', as: :dashboard
      resources :users, except: %i[new create]
      resources :teams
      resources :collaborators
    end
  end

  namespace :api, path: ENV['API_PATH'], defaults: { format: :json } do
    namespace :v1 do
      scope :users do
        post '/sign_up', to: 'users#sign_up'
        post '/sign_in', to: 'users#sign_in'
        post '/refresh', to: 'users#refresh'
        get '/whoami', to: 'users#whoami'
      end

      resources :teams, only: %i[index show create update destroy] do
        resources :retros, only: %i[index show create update destroy]
        resources :invites, only: %i[index show create update destroy]
        resources :collaborators, only: %i[index show update destroy]
      end

      resource :storages, only: %i[create update destroy show]
    end
  end
end
