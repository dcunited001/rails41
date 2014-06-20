# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

cors_origins = case Rails.env
                 when 'test'        then '*'
                 when 'development' then '*'
                 when 'staging'     then 'ng-rails-stack-client.herokuapp.com'
                 when 'production'  then '*'
               end

require 'rack/cors'
use Rack::Cors do
  # TODO: secure

  # allow all origins in development
  allow do
    origins cors_origins
    resource '*',
             :headers => :any,
             :methods => [:get, :post, :delete, :put, :options]
  end
end
