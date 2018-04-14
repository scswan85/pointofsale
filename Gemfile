source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'better_errors', '~> 2.4'
gem 'devise', '~> 4.4', '>= 4.4.3'
gem 'bootstrap', '~> 4.0'
gem 'jquery-rails'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'
gem 'petergate', '~> 1.8', '>= 1.8.1'
gem 'stripe', '~> 3.13'
gem 'binding_of_caller', '~> 0.8.0'
gem 'pry-byebug', '~> 3.6'
