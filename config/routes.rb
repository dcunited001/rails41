require 'resque/server'

Rails.application.routes.draw do

  # TODO: secure resque/server
  mount Resque::Server.new, :at => '/resque'

  scope :api, constraints: { format: :json } do
    scope :v1 do
      devise_for :users
      resources :users, only: [:index, :show]
    end
  end

  get '/*url', :to => 'home#index' #TODO: set to set correct app state?
  root to: 'home#index'

end
