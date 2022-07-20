source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

# Assets
gem 'bootstrap-sass', '3.4.1'
gem 'font-awesome-rails'
gem 'importmap-rails', '1.0.3'
gem 'jquery-rails'
gem 'popper_js'
gem 'sassc-rails', '2.1.2'
gem 'sprockets-rails', '3.4.2'

# Iternationalize and/or localize your Rails application
gem 'rails-i18n', '~> 7.0.0'

# Declaring JSON structures
gem 'jbuilder', '2.11.5'

# Database
gem 'pg', '1.3.5'

# Puma web server
gem 'puma', '~> 5.0'

# Fullstack web framework
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Html preprocessor
gem 'haml-rails', '2.0.1'

# Hotwire's modest JavaScript framework
gem 'stimulus-rails', '1.0.4'

# Hotwire's SPA-like page accelerator
gem 'turbo-rails', '1.0.1	'

# Reduces boot times through caching
gem 'bootsnap', '1.11.1', require: false

# Installed to prevent the double load of net/protocol
gem 'net-http'

# Pagination gem
gem 'pagy', '~> 5.10'

# Adds an object-oriented layer of presentation logic to your Rails application.
gem 'draper', '4.0.2'

# A library for generating fake data
gem 'faker', '2.20.0'

# Is a fixtures replacement with a straightforward definition syntax
gem 'factory_bot_rails', '6.2.0'

# Rails forms made easy.
gem 'simple_form'

# Authentication solution for Rails
gem 'devise'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'

group :development, :test do
  gem 'debug', '1.5.0', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug', '3.9.0'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
end

group :development do
  gem 'brakeman'
  gem 'bundler-audit', '0.9.0.1'
  gem 'fasterer', '0.9.0'
  gem 'gemsurance', '0.10.0'
  gem 'lefthook', '0.7.7'
  gem 'rack-mini-profiler', '3.0.0'
  gem 'rails_best_practices'
  gem 'rubocop-performance', '1.13.3', require: false
  gem 'rubocop-rails', '2.14.2', require: false
  gem 'rubocop-rspec', '2.9.0', require: false
  gem 'solargraph', '0.44.3'
  gem 'spring', '4.0.0'
  gem 'web-console', '4.2.0'
end

group :test do
  gem 'capybara', '	3.36.0'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '0.21.2', require: false
  gem 'webdrivers', '5.0.0'
end
