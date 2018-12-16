# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Base gems for app
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 4.0'

# Files uploading (ActiveStorage)
gem 'aws-sdk-s3', '~> 1.23.1', require: false
gem 'mini_magick', '~> 4.8'

# Gem for fake data
gem 'faker', '~> 1.9', '>= 1.9.1'

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
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
