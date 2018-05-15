source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'activeadmin'
gem 'aws-sdk-s3', '~> 1'
gem 'bootstrap', '~> 4.1.1'
gem 'devise'
gem 'jbuilder', '~> 2.5'
gem 'paperclip', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.1.6'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'simple_token_authentication', '~> 1.0'
gem 'slim-rails'

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop', '~> 0.55.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
