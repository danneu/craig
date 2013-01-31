require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/test_helper.rb", "test/*_test.rb"]
end
desc "Run tests"
task :default => :test

namespace :cities do
  desc "Update Craig::CITIES using Craigslists' city directory"
  task :update do
     system("ruby lib/craig/tasks/update_cities.rb")
  end
end
