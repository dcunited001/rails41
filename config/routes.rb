require 'resque/server'

Rails.application.routes.draw do

  # TODO: secure resque/server
  mount Resque::Server.new, :at => "/resque"

  scope :api, constraints: { format: :json } do
    scope :v1 do
      devise_for :users
      devise_scope :user do
        post 'login' => 'sessions#create', :as => 'login'
        post 'logout' => 'sessions#destroy', :as => 'logout'
        get 'current_user' => 'sessions#show_current_user', :as => 'show_current_user'
      end

      resources :users, only: [:index, :show]
    end
  end

  get '/*url', :to => 'home#index' #TODO: set to set correct app state?
  root to: 'home#index'

end
