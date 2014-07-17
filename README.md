# Rails41 - A Containerized Rails API Template

A simple Rails 4.1 API, integrated with the [lineman-angular-ui-bootstrap](https://github.com/dcunited001/lineman-angular-ui-bootstrap) client 
in [Appistack](https://github.com/dcunited001/appistack).

## TODO
- TODO: fix integration tests (AngularJS not working properly with Poltergeist)
- TODO: configure/launch on heroku & test updates to project on Nitrous.IO
- TODO: set up token based auth for devise
  - update devise controller to pass token data back to client
  - add api tests for auth controllers & other controllers so far

## References:
- Jose Valim - [Token-based auth for Devise](https://gist.github.com/josevalim/fb706b1e933ef01e4fb6)
- Devise - [Token-based auth](https://github.com/plataformatec/devise/wiki/How-To:-Simple-Token-Authentication-Example)

### Getting Started

1. `bundle install`
1. `brew install phantomjs` - for tests.
1. `rake secret` - to generate keys for secret.yml
1. `rake db:create:all && rake db:migrate`
1. `rails s`

### Running Unit Tests

1. `rake test`

### Running Integration Tests

1. `rake spec`

### Problems

Rails-Lineman is not configuring the assets to be served correctly.
- webfonts works, but not js/css
- have to configure the helper methods to point to the files on lineman instead
- tried changing `config.assets.debug` and `config.serve_static_assets`
- seemed to work until i compiled the assets, but now it doesn't work even when i remove them
- need to dig into the rails-lineman code.  maybe it doesn't work 100% with Rails 4.1
- rails just doesn't realize that it should be serving these assets, the path goes to the wrong route.