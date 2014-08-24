require 'require_all'
require 'rspec'
require 'coveralls'
require 'factory_girl'
require 'database_cleaner'
require 'active_support/core_ext/object/instance_variables'

require_all File.expand_path('../support', __FILE__)
require_all File.expand_path('../../lib', __FILE__)

Coveralls.wear!

ActiveRecord::Base.establish_connection(
                                        adapter: 'sqlite3',
                                        database: File.expand_path('../../db/test.sqlite3', __FILE__),
                                        pool: 5,
                                        timeout: 5000
                                        )

RSpec.configure do |c|
  c.include ActiveFilter

  c.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  c.around(:each) do |example|
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end
end