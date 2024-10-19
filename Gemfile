source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby ">= 3.0.0"

gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "puma", "~> 6"
gem "turbo-rails"
gem "turbolinks", "~> 5"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false
gem "devise"
gem "devise-bootstrap-views"
gem "factory_bot_rails"
gem "json"
gem "cssbundling-rails", "~> 1.2"
gem "jsbundling-rails", "~> 1.1"
gem "sassc-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "sqlite3", "~> 1.4"
  gem "rspec-rails"
end

group :development do
  gem "importmap-rails"
  gem "solargraph"
  gem "erb_lint"
  gem "brakeman", require: false
  gem "hotwire-livereload", "~> 1.2"
end

group :production do
  gem "pg"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "capybara-screenshot"
end
