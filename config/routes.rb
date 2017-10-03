Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => "/cable"
  
  resources :channels, only: [ :show ]
  root to: 'channels#show'
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :channels, only: [] do
        resources :messages, only: [ :index, :create ]
      end
    end
  end
end
