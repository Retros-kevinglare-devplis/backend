Rails.application.routes.draw do
  scope module: 'api', path: 'api', constraints: { format: 'json' } do
    scope module: 'v1', path: 'v1' do
      scope path: 'users' do
        post '/sign_up', to: 'users#sign_up'
        post '/sign_in', to: 'users#sign_in'
      end
    end
  end
end
