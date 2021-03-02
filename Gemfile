source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml'
gem 'haml-rails', '~> 1.0'
gem 'paperclip', '~> 5.2.1'
gem 'simple_form'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'acts_as_votable', '~> 0.11.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
