require 'rspec/core/rake_task'
require 'active_record'

Dir.glob('tasks/*.rake').each {|r| load r}
load 'active_record/railties/databases.rake'

ActiveRecord::Tasks::DatabaseTasks.database_configuration = './config/database.yml'
ActiveRecord::Tasks::DatabaseTasks.migrations_paths = '/db/migrate'
ActiveRecord::Migrator.migrations_paths = ActiveRecord::Tasks::DatabaseTasks.migrations_paths

# namespace :db do 
#   task :load_config do
#     ActiveRecord::Base.configurations = ActiveRecord::Tasks::DatabaseTasks.database_configuration || {}
#     ActiveRecord::Migrator.migrations_paths = ActiveRecord::Tasks::DatabaseTasks.migrations_paths
#   end

#   namespace :create do 
#     task :all => :load_config do 
#       ActiveRecord::Tasks::DatabaseTasks.create_all
#     end
#   end

#   desc 'Creates the database from DATABASE_URL or config/database.yml'
#   task :create => [:load_config] do 
#     ActiveRecord::Tasks::DatabaseTasks.create_current
#   end

#   namespace :drop do 
#     task :all => :load_config do
#       ActiveRecord::Tasks::DatabaseTasks.drop_all
#     end
#   end

#   desc 'Drops the database from DATABASE_URL or config/database.yml'
#   task :drop => [:load_config] do 
#     ActiveRecord::Tasks::DatabaseTasks.drop_current
#   end

#   namespace :purge do 
#     task :all => :load_config do 
#       ActiveRecord::Tasks::DatabaseTasks.purge_all
#     end
#   end

#   desc 'Empty the database from DATABASEURL or config/database.yml'
#   task :purge => [:load_config] do 
#     ActiveRecord::Tasks::DatabaseTasks.purge_current
#   end

#   # FIX ME!! :environment = bad
#   desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog'"
#   task :migrate [:environment, :load_config] do 
#     ActiveRecord::Tasks::DatabaseTasks.migrate
#     db_namespace['_dump'].invoke if ActiveRecord::Base.dump_schema_after_migration
#   end
# end

RSpec::Core::RakeTask.new

task :default => [:spec]