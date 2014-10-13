# Rails41 - A Containerized Rails API Template

A simple Rails 4.1 API, integrated with the [lineman-angular-ui-bootstrap](https://github.com/dcunited001/lineman-angular-ui-bootstrap) client 
in [Appistack](https://github.com/dcunited001/appistack).

## TODO
- TODO: configure/launch on heroku
- TODO: set up token based auth for devise
  - update devise controller to pass token data back to client
  - add api tests for auth controllers & other controllers so far

## References:

- [Containerize Rails App](http://blog.zedroot.org/containerize-your-rails-application/)
- [Sinatra/Logstash/Elastic on CoreOS](http://marceldegraaf.net/2014/05/05/coreos-follow-up-sinatra-logstash-elasticsearch-kibana.html)

- Jose Valim - [Token-based auth for Devise](https://gist.github.com/josevalim/fb706b1e933ef01e4fb6)
- Devise - [Token-based auth](https://github.com/plataformatec/devise/wiki/How-To:-Simple-Token-Authentication-Example)
- Grape on Rails - [Using Devise Tokens](http://funonrails.com/2014/03/api-authentication-using-devise-token/)

 https://github.com/dblock/grape-on-rails
 https://github.com/doorkeeper-gem/doorkeeper
 https://github.com/intridea/grape/wiki/Grape-and-Rails-Path-Helpers
 http://bitboxer.de/2014/02/09/grape/
 http://funonrails.com/2014/03/building-restful-api-using-grape-in-rails/
 http://mikecoutermarsh.com/organize-your-grape-api-in-rails/
 http://funonrails.com/2014/03/api-authentication-using-devise-token/
 http://funonrails.com/2014/03/building-restful-api-using-grape-in-rails/
 https://github.com/gonzalo-bulnes/simple_token_authentication
 https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs

### Getting Started

1. `bundle install`
1. `brew install phantomjs` - for tests.
1. `rake secret` - to generate keys for secret.yml
1. `rake db:create:all && rake db:migrate`
1. `rails s`

### Running Unit Tests

1. `rake test`

### Running Integration Tests

N/A -- Integration tests are now assumed to run in the frontend framework 
- bye bye capybara and ruby :( i really tried as hard as i could to keep all tests ruby
- also, rails is no longer serving any html
