# TODO: set up integration environment
#   - problems with ActionDispatch::IntegrationTest
#   - before filter undefined
#   - it looks like gems are not being loaded properly for integration
ENV["RAILS_ENV"] ||= "test"

require 'spec_helper'
require 'capybara/rails'
require 'capybara/poltergeist'

webdriver = Rails.application.secrets.capybara_webdriver.to_sym
jsdriver = Rails.application.secrets.capybara_jsdriver.to_sym

Capybara.configure do |c|
  c.default_driver = webdriver
  c.javascript_driver = jsdriver
end

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

ROOT_URL = "http://#{Rails.application.secrets.ng_hostname}:#{Rails.application.secrets.ng_port}"

module ActionDispatch
  class IntegrationTest

    include Capybara::DSL

    before { set_page_size_to_13inch_macbook_air }
    after  { capybara_reset_sessions! }

    protected

    def capybara_reset_sessions!
      Capybara.reset_sessions!
    end

    def set_page_size_to_13inch_macbook_air
      # TODO: fix resize method for capybara_webkit
      page.driver.resize 1440, 900 unless Capybara.current_driver == :webkit
    end

    def execjs(string)
      page.evaluate_script(string)
    end

  end

end

# Support transaction fixtures. Single connection.
# class ActiveRecord::Base
#   def self.connection
#     @@shared_connection ||= retrieve_connection
#   end
# end
