source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.2.0.beta1'
gem 'pg'
gem 'sass-rails', '~> 5.0.0.beta1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'rails-html-sanitizer', '~> 1.0'

gem 'haml'
gem 'simple_form', '3.1.0.rc2'
gem 'virtus'

group :development, :test do
  gem 'byebug'

  # Access an IRB console on exceptions page and /console in development
  gem 'web-console', '~> 2.0.0.beta2'

  gem 'spring'

  gem 'rspec-rails', '~> 3.0.0'
end

group :test do
  gem 'capybara'
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'unicorn'

  # Enable gzip compression on heroku, but don't compress images.
  gem 'heroku-deflater'

  # Heroku injects it if it's not in there already
  gem 'rails_12factor'
end

gem 'memcachier'
gem 'dalli'
# Fast IO for memcache
gem 'kgio'

# Serve static assets through Rack + Memcache
# https://devcenter.heroku.com/articles/rack-cache-memcached-rails31
gem 'rack-cache'
