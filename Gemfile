source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'


gem 'rails', '~> 6.1.3', '>= 6.1.3.2'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem "rack-cors", "~> 1.1"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 5.0"
  gem "factory_bot_rails", "~> 6.2"
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem "letter_opener", "~> 1.7"
end

group :test do
  gem "shoulda-matchers", "~> 4.5"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "faker", "~> 2.18", :groups => [:development, :test]

gem "devise_token_auth", "~> 1.1"


gem "active_model_serializers", "~> 0.10.12"

