Rails.application.routes.draw do
  namespace :api, path: ENV['API_PATH'], defaults: { format: :json } do
    namespace :v1 do
      scope :users do
        post '/sign_up', to: 'users#sign_up'
        post '/sign_in', to: 'users#sign_in'
        post '/refresh', to: 'users#refresh'
        get '/whoami', to: 'users#whoami'
      end

      resources :teams, only: %i[index create update destroy show] do
        resources :retros, only: %i[index create update destroy show]
        resources :invites, only: %i[index create update destroy]
        resources :collaborators, only: %i[index create update destroy]
      end
    end
  end
end
