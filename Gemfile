source 'https://rubygems.org'

ruby '~> 2.6.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '~> 4.2'
gem 'coffee-rails', '~> 5.0'
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.10'
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'rails-ujs'

# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
	gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'slim-rails'
gem 'materialize-sass'
gem 'jquery-ui-rails'

gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'devise'
gem 'cancancan'

gem 'rubocop'
