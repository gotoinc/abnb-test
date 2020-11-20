source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Swagger tooling for Rails API's (https://github.com/domaindrivendev/rswag)
gem 'rswag-api'
gem 'rswag-ui'

# WebDriver is a tool for writing automated tests of websites.
gem 'selenium-webdriver'

# Easy installation and use of chromedriver, the Chromium project's Selenium webdriver adapter.
gem 'chromedriver-helper'

# Faraday is an HTTP client library that provides a common interface over many adapters (such as Net::HTTP) and embraces the concept of Rack middleware when processing the request/response cycle.
gem 'faraday'

# Devise is a flexible authentication solution for Rails based on Warden.
gem 'devise'

# Shim to load environment variables from .env into ENV in development.
gem 'dotenv-rails', groups: [:development, :test]

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Rspec (http://github.com/rspec)
  gem 'rspec', '~> 3.9'

  # RSpec for Rails (https://github.com/rspec/rspec-rails)
  gem 'rspec-rails', '~> 3.9'

  # Seamlessly adds a Swagger to Rails-based API's (https://github.com/domaindrivendev/rswag)
  gem 'rswag-specs'

  # Automatic Ruby code style checking tool (https://github.com/rubocop-hq/rubocop)
  gem 'rubocop', '~> 0.77', require: false

  # An IRB alternative and runtime developer console (http://pryrepl.org)
  gem 'pry', '~> 0.12'

  # Use Pry as your rails console (https://github.com/rweng/pry-rails)
  gem 'pry-rails', '~> 0.3'

  # Fast debugging with Pry (https://github.com/deivid-rodriguez/pry-byebug)
  gem 'pry-byebug', '~> 3.7' # Call 'byebug' anywhere in the code to stop execution and get a debugger console

  # Provides YARD and extended documentation support for Pry (https://github.com/pry/pry-doc)
  gem 'pry-doc', '~> 1.0'

  # Automatic Rails code style checking tool (https://github.com/rubocop-hq/rubocop-rails)
  gem 'rubocop-rails', '~> 2.4'

  # Annotates Rails Models, routes, fixtures, and others based on the database schema (http://github.com/ctran/annotate_models)
  gem 'annotate'

  # Draper adds an object-oriented layer of presentation logic to your Rails application.
  gem 'draper'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
