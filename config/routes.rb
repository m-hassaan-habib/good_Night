Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create] do
        resources :sleep_records, only: [:index, :create]
        resources :followings, only: [:index, :create, :destroy]
        resources :friend_sleep_records, only: [:index]
      end
    end
  end
  
  post '/', to: 'api/v1/users#create'
end
