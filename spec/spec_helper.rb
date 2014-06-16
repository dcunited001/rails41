ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'minitest/pride'

ActiveRecord::Migration.maintain_test_schema!

require 'database_cleaner'
DatabaseCleaner.strategy = :transaction

require 'rails/test_help'
class ActiveSupport::TestCase
  before { DatabaseCleaner.start }
  after { DatabaseCleaner.clean }
end
