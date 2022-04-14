source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.3"


gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "sprockets-rails"
gem "haml-rails"
gem 'bootstrap-sass'
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", require: false
gem "sassc-rails"
gem 'draper'
gem 'faker'
gem 'aasm'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'pry-byebug'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
  gem "spring"
  gem 'rubocop-rails', require: false
  gem 'brakeman'
  gem 'lefthook'
  gem 'bundler-audit'
  gem 'solargraph'
  gem 'rubocop-rspec', require: false
  gem 'rubocop-performance', require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
end
