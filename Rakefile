# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

begin
  require 'rake'

  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = Dir.glob('spec/unit/*/*_spec.rb')
  end

  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = Dir.glob('spec/integration/*/*_spec.rb')
  end

  RSpec::Core::RakeTask.new(:functional) do |t|
    t.pattern = Dir.glob('spec/functional/*/*_spec.rb')
  end
end
