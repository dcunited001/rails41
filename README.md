## Rails41

A simple Rails 4.1 API, integrated with the [lineman-angular-ui-bootstrap](https://github.com/dcunited001/lineman-angular-ui-bootstrap) client 
in [Appistack](https://github.com/dcunited001/appistack).

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
