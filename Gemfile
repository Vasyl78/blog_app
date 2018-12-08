source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Base gems for app
gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 4.0'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'factory_bot_rails', '~> 4.11.1'
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.8.1'
  gem 'rspec_api_documentation', '~> 6.1.0'
  gem 'rubocop', '~> 0.60.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
