Gem::Specification.new do |gem|
  gem.name                  = "activefilter"
  gem.version               = "0.0.0"

  gem.description           = "Advanced filtering for ActiveRecord"
  gem.summary               = gem.description
  gem.homepage              = 'http://github.com/danascheider/active_filter'
  gem.author                = 'Dana Scheider'

  gem.license               = 'MIT'

  gem.files                 = Dir['lib/**/*'] + ['README.md']
  gem.require_path          = 'lib'
  gem.test_files            = gem.files.grep(%r{^(test|spec)/})
  gem.required_ruby_version = '>= 1.9.3'

  gem.add_dependency 'activerecord', '~> 4.1'
  gem.add_dependency 'require_all', '~> 1.3'

  gem.add_development_dependency 'rake', '~> 10.3'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.9'
  gem.add_development_dependency 'factory_girl', '~> 4.4'
  gem.add_development_dependency 'database_cleaner', '~> 1.3'
  gem.add_development_dependency 'coveralls', '~> 0.7.1'
end