source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem 'devise', '~> 3.2.0'
gem 'pg', '~> 0.17.0'
gem 'rake', '~> 10.3.2'
gem 'jbuilder', '~> 2.0'

# gem 'doorkeeper', '~> 0.7.0'
# gem 'jquery-rails' # for doorkeeper (asset:precompile)
# TODO: remove jquery-rails?

gem 'resque', '~> 1.25.1'
gem 'resque_mailer', '~> 2.2.6'
gem 'devise-async', '~>  0.9.0'

gem 'rails-lineman'
gem 'rack-cors', '~> 0.2.9' #, require: 'rack/cors' # TODO: require necessary for heroku?
#gem 'heroku_secrets'
#gem 'rails_12factor', group: :production

group :development, :test do
  gem 'pry', '~> 0.9'
end

group :test do
  gem 'minitest', '~> 5.3.4'
  gem 'minitest-focus'
  gem 'minitest-spec-rails'
  gem 'minitest-metadata', '~> 0.5.3'
  gem 'poltergeist', '~> 1.4.1'
  gem 'capybara-webkit', '~> 1.1.1'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'launchy', '~> 2.4.2'

  # it'd be cool if i could use my websocket minitest reporter!
  # gem 'minitest-reporters', '~> 1.0.0.beta3'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

#ruby "2.0.0"
