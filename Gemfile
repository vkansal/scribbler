source 'http://rubygems.org'

gem 'rails', '3.0.10'
gem 'jquery-rails'
gem  'ms-translate' ,:git => 'https://github.com/elubow/ms-translate.git'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', :group => :production
#gem 'twitter-stream', '~> 0.1.14'
gem 'twitter-stream', :branch => 'oauthfix',
                      :git => 'git://github.com/infospace/twitter-stream.git'
gem 'oa-oauth'
gem 'pusher'
gem 'em-http-request', '~> 1.0.0'
#gem 'delayed_job', '~> 2.1.4'

# Use thin as the web server
gem 'thin', :platform => 'ruby'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'heroku'
  gem 'heroku-rails'
  gem 'foreman'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'web-app-theme', '~> 0.7.0'
end
