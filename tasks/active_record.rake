require 'active_support/core_ext/string/strip'
require 'pathname'
require 'fileutils'

namespace :db do 
  task :environment do 
    'test'
  end

  desc 'Create a migration (parameters: NAME, VERSION)'
  task :create_migration do 
    unless name = ENV['NAME']
      puts "No NAME specified. Example usage: `rake db:create_migration NAME=create_users`"
      exit
    end

    version = ENV['VERSION'] || Time.now.utc.strftime("%Y%m%d%H%M%S")

    migration_files = Pathname(ActiveRecord::Tasks::DatabaseTasks.migrations_paths).children
    if duplicate = migration_files.find {|path| path.basename.to_s.include?(name) }
      puts "Another migration is already named '#{name}': #{duplicate}"
      exit
    end

    filename = "#{version}_#{name}.rb"
    dirname  = ActiveRecord::Migrator.migrations_path
    path     = File.join(dirname, filename)

    FileUtils.mkdir_p(dirname)
    File.write path, <<-MIGRATION.strip_heredoc
      class #{name.camelize} < ActiveRecord::Migration
        def change
        end
      end
    MIGRATION
    puts path
  end
end