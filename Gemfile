# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'callee', '~> 0.3.5'
gem 'draper', '~> 4.0.1'
gem 'dry-auto_inject', '~> 0.7.0'
gem 'dry-core', '~> 0.4.9'
gem 'dry-initializer', '~> 3.0'
gem 'dry-monads', '~> 1.3.5'
gem 'dry-struct', '~> 1.3.0'
gem 'dry-types', '~> 1.4.0'
gem 'dry-validation', '~> 1.5.6'
gem 'faraday', '~> 1.3.0'
gem 'faraday_middleware', '~> 1.0.0'
gem 'grape', '~> 1.5.1'
gem 'grape-swagger', '~> 1.3.1'
gem 'grape-swagger-entity', '~> 0.3'
gem 'grape-swagger-rails', '~> 0.3.1'
gem 'money-rails', '~> 1.12'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors', '~> 1.0.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'pry-byebug', '~> 3.9.0'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rubocop', '~> 1.3.1'
end

group :development do
  gem 'annotate', '~> 3.1.1'
  gem 'listen', '~> 3.2'
  gem 'rubocop-rspec', '~> 2.0.0', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'simplecov', '0.17.1'
  gem 'webmock', '~> 3.11.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
