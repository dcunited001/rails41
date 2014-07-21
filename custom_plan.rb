require 'zeus/rails'

class AppistackPlan < Zeus::Rails

  def test_environment
    Bundler.require(:test)
    require APP_PATH

    $rails_rake_task = 'yup' # lie to skip eager loading
    ::Rails.env = ENV['RAILS_ENV'] = 'test'
    ::Rails.application.require_environment!
    $rails_rake_task = nil

    $LOAD_PATH.unshift ".", "./lib", "./test", "./spec"
  end

  def test_helper
    prevent_minitest_exit_hook
    require 'spec_helper'
  end

  def test(argv=ARGV)
    MiniTest::Unit::TestCase.test_suites
    Zeus::M.run(argv)
  end

  alias :spec_environment :test_environment

  def spec_helper
    prevent_minitest_exit_hook
    require 'spec_helper_integration'
  end

  alias :spec :test

  protected

  def prevent_minitest_exit_hook
    require 'minitest/unit'
    MiniTest::Unit.class_variable_set("@@installed_at_exit", true)
  rescue LoadError
    # noop
  end

end

Zeus.plan = AppistackPlan.new

