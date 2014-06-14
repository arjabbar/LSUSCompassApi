source 'https://rubygems.org'

gem 'rails',            github: "rails/rails", branch: "4-1-stable"
gem 'arel',             github: "rails/arel", branch: "5-0-stable"

# Use postgresql as the database for Active Record
gem 'pg'
# Use edge version of sprockets-rails
gem 'sprockets-rails',  github: "rails/sprockets-rails"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development, :test do
  gem 'spring'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :production do
  gem 'rails_12factor'
end
