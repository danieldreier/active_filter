require 'require_all'
require 'rspec'
require 'coveralls'
require 'factory_girl'
require_all File.expand_path('../support', __FILE__)
require_all File.expand_path('../../lib', __FILE__)

Coveralls.wear!

RSpec.configure do |c|
  c.include ActiveFilter
end