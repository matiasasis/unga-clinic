# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

gem 'aws-sdk-s3', require: false
gem 'bootsnap', require: false
gem 'devise'
gem 'image_processing', '~> 1.12', '>= 1.12.2'
gem 'paranoia', '~> 2.6.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'will_paginate', '~> 3.3'
gem 'friendly_id', '~> 5.4.0'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', require: 'dotenv/rails-now'
end

group :development do
  gem 'annotate'
  gem 'awesome_print'
  gem 'hirb'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
end
