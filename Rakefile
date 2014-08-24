require 'rspec/core/rake_task'
require 'active_record'
require 'active_record/tasks/sqlite_database_tasks'
require 'active_record/tasks/database_tasks'
require 'yaml'
require 'fileutils'

include ActiveRecord::Tasks::DatabaseTasks

Dir.glob('tasks/*.rake').each {|r| load r}
load 'active_record/railties/databases.rake'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/test.sqlite3',
  pool: 5,
  timeout: 5000
  )

ActiveRecord::Tasks::DatabaseTasks.tap do |config|
  config.env                    = 'test'
  config.db_dir                 = File.expand_path('../db', __FILE__)
  config.migrations_paths       = File.expand_path('../db/migrate', __FILE__)
  config.database_configuration = ActiveRecord::Base.configurations
  config.root                   = File.expand_path('../spec/support', __FILE__)
end

# Hanging on to these lines while I experiment with other ways of making the ActiveRecord
# tasks work:
#
# db_yml = File.expand_path('config/database.yml')
# ActiveRecord::Tasks::DatabaseTasks.database_configuration = YAML.load_file(db_yml)
# ActiveRecord::Migrator.migrations_path = ActiveRecord::Tasks::DatabaseTasks.migrations_paths

Rake::Task["db:load_config"].clear
Rake::Task.define_task("db:environment")
Rake::Task["db:test:deprecated"].clear if Rake::Task.task_defined?("db:test:deprecated")

RSpec::Core::RakeTask.new
Rake::Task['db:test:prepare'].invoke

task :default => [:spec]