source 'https://rubygems.org'

gem 'rails', '4.1.4'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass',  '3.2.0.2'
gem 'faker', '1.4.2'
gem 'will_paginate',           '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'

### OpenShift Online changes:

# Fix the conflict with the system 'rake':
gem 'rake', '~> 0.9.6'

# Support for databases and environment.
# Use 'sqlite3' for testing and development and mysql and postgresql
# for production.
#
# To speed up the 'git push' process you can exclude gems from bundle install:
# For example, if you use rails + mysql, you can:
#
# $ rhc env set BUNDLE_WITHOUT="development test postgresql"
#
group :development, :test do
  gem 'sqlite3'
  gem 'minitest'
  gem 'thor'
  # Use Byebug (recommended online since debugger doesn't work well with Ruby 2.0)
	gem 'byebug'
end

# Add support for the MySQL
#group :production, :mysql do
 # gem 'mysql2'
#end

group :production, :postgresql do
  gem 'pg'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end
### / OpenShift changes

group :doc do 
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
#gem 'debugger', group: [:development, :test]



