require 'require_all'
require 'rspec'
require 'coveralls'
require_all File.expand_path('../../lib', __FILE__)

Coveralls.wear!

RSpec.configure do |c|
  c.include ActiveFilter
end