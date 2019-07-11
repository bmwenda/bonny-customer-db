Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'v1', constraints: ApiVersion.new('v1', true) do
    post '/signup', to: 'users#create'
    get 'users/:id', to: 'users#show'
    resources :customers, only: [:create]
  end

  root 'application#heartbeat'
  match '*path', to: 'errors#path_not_found', via: :all
end
