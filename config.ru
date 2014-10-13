# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

cors_origins = ENV['RACK_CORS_ORIGINS'] || '*'

require 'rack/cors'
use Rack::Cors do
  # TODO: secure
  allow do
    origins cors_origins
    resource '*',
             :headers => :any,
             :methods => [:get, :post, :delete, :put, :options]
  end
end
