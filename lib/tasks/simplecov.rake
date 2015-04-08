unless defined?(Rails)
  require "bundler/gem_tasks"
  require 'rake/testtask'
end

namespace :test do
  desc "Create test coverage"
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task["test"].execute
  end
end
