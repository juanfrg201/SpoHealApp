source "https://rubygems.org"

ruby "3.0.3" # Corregido a una versión válida de Ruby

# Framework y gemas de Rails
gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "bulma-rails"
gem "disco"
gem "image_processing", "~> 1.12"
gem "paperclip", "~> 4.2"
gem "aws-sdk-s3", require: false
gem "web-push"
gem "rack-cors"
gem "sidekiq", "~> 5.2.8"
gem "csv"
gem "will_paginate"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem "rolify"
gem "chartkick"

# Grupo de desarrollo y prueba
group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "rails-controller-testing"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

