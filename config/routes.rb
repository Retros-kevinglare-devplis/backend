Rails.application.routes.draw do
  scope module: 'api', path: 'api', constraints: { format: 'json' } do
    scope module: 'v1', path: 'v1' do
      scope path: 'users' do
        post '/sign_up', to: 'users#sign_up'
        post '/sign_in', to: 'users#sign_in'
        post '/refresh', to: 'users#refresh'
        get '/whoami', to: 'users#whoami'
      end

      resources :teams, only: %i[index create update destroy show] do
        resources :retros, only: %i[index create update destroy]
        resources :invites, only: %i[index create update destroy]
        resources :collaborators, only: %i[index create update destroy]
      end
    end
  end
end
