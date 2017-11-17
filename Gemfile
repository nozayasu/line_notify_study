source "https://rubygems.org"

ruby "2.4.1"

gem "rails", "~> 5.1.3"

gem "coffee-rails", "~> 4.2"
gem "faraday"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mysql2"
gem "rails_12factor", require: ENV.include?("HEROKU")
gem "sass-rails", "~> 5.0"
gem "settingslogic"
gem "slim-rails"
gem "twitter-bootstrap-rails"
gem "uglifier", ">= 1.3.0"


group :development do
  gem "activerecord-cause"
  gem "annotate"
  gem "awesome_print"
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "capistrano", require: false
  gem "capistrano-bundler", require: false, github: "capistrano/bundler"
  gem "capistrano-rails", require: false
  gem "capistrano-rbenv", require: false
  gem "capistrano3-unicorn", require: false
  gem "did_you_mean"
  gem "hirb-unicode"
  gem "rack-dev-mark", group: :staging
  gem "rubocop", "~> 0.35.1"
  gem "rack-mini-profiler"
  gem "view_source_map"
  gem "spring"
  gem "spring-commands-rspec"
  gem "thin"
  gem "web-console", "~> 2.0"
end

group :development, :test do
  gem "active_decorator-rspec", require: false
  gem "faker"
  gem "listen", "~> 3.1.5"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.5"
end

group :test do
  gem "database_rewinder"
  gem "factory_girl_rails"
  gem "rails-controller-testing", require: false
  gem "rspec-parameterized"
  gem "rspec-request_describer"
  gem "simplecov", require: false
  gem "webmock"
end

group :staging, :production do
  gem "exception_notification"
  gem "lograge"
  gem "newrelic_rpm"
  gem "rack-health"
  gem "slack-notifier"
  gem "unicorn"
end
