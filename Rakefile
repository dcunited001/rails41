# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
require 'rake/testtask'
require 'resque/tasks'

# unit tests
Rake::TestTask.new do |t|
  t.libs << "spec"
  t.test_files = FileList['spec/models/**/*_spec.rb',
                          'spec/controllers/**/*_spec.rb']
  t.verbose = true
end

# integration tests
Rake::TestTask.new(:spec) do |t|
  t.libs << "spec"
  t.test_files = FileList['spec/integration/**/*_spec.rb']
  t.verbose = true
end

task :default => :test
