source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "rails", "~> 7.0.1"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "jbuilder"
gem "tzinfo-data"
gem "bootsnap", require: false
gem 'securerandom', '~> 0.2.0'
gem 'faker'
gem "rack-cors"
gem "bcrypt", "~> 3.1.7"
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'graphql'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'graphiql-rails'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end