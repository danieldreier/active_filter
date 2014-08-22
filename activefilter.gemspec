Gem::Specification do |gem|
  gem.name = "activefilter"
  gem.version = "0.0.0"

  gem.description = "Advanced filtering for ActiveRecord"
  gem.homepage = 'http://github.com/danascheider/active_filter'
  gem.author = 'Dana Scheider'

  gem.license = 'MIT'

  gem.files = Dir['lib/**/*'] + ['README.md']
  gem.require_path = 'lib'
  gem.test_files = gem.files.grep(%r{^(test|spec)/})

  gem.required_ruby_version = '>= 1.9.3'
  gem.add_dependency 'activerecord', '>= 4.1.5'
  gem.add_dependency 'require_all', '>= 1.3.2'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'factory_girl', '~> 4.4'
  gem.add_development_dependency 'database_cleaner', '>= 1.3.0'
  gem.add_development_dependency 'coveralls'
end