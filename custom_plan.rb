require 'zeus/rails'

# Not using zeus for tests until the following items can be resolved

# TODO: fix problem where specs run twice
# - see https://github.com/burke/zeus/issues/269
# - this bug should be fixed by zeus v15.1
# TODO: Zeus is not compatible with MiniTest 5
# - see this issue - https://github.com/qrush/m/issues/35
# - this is because Zeus refers to MiniTest::Unit::TestCase.test_suites
#   - instead of MiniTest::Runnable
# - one option is to monkeypatch Zeus::M to either:
#   - use the right method
#   - or replace the suites method
#   - submit patch to zeus?

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

