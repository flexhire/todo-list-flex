Rails.application.routes.draw do
  devise_for :users
  resources :tasks, except: [:show] do
    patch :status
  end

  root to: 'tasks#index'

  ## API ##
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tasks
      resources :users
      resources :sessions, only: [:create, :destroy]
    end
  end
end
