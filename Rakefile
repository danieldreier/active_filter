require 'rspec/core/rake_task'
require 'active_record'
require 'active_record/tasks/sqlite_database_tasks'
require 'active_record/tasks/database_tasks'
require 'yaml'
require 'fileutils'

db_yml = File.expand_path('config/database.yml')

include ActiveRecord::Tasks::DatabaseTasks

ActiveRecord::Tasks::DatabaseTasks.tap do |config|
  config.env                    = 'test'
  config.db_dir                 = File.expand_path('../db', __FILE__)
  config.migrations_paths       = File.expand_path('../db/migrate', __FILE__)
  config.database_configuration = ActiveRecord::Base.configurations
  config.root                   = File.expand_path('../spec/support', __FILE__)
end

#ActiveRecord::Tasks::DatabaseTasks.database_configuration = YAML.load_file(db_yml)
ActiveRecord::Migrator.migrations_path = ActiveRecord::Tasks::DatabaseTasks.migrations_paths

Dir.glob('tasks/*.rake').each {|r| load r}
load 'active_record/railties/databases.rake'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/test.sqlite3',
  pool: 5,
  timeout: 5000
  )

RSpec::Core::RakeTask.new
Rake::Task['db:test:prepare'].invoke

task :default => [:spec]