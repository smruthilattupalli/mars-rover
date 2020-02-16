# frozen_string_literal: true

require 'rspec/core/rake_task'

# Define the rake "spec" task
RSpec::Core::RakeTask.new(:spec)

desc 'Run all tests'
task all_tests: :environment do
  Rake::Task['spec'].invoke
end

task default: :spec
