source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'pg', group: :production
gem 'thin', group: :production

gem 'jquery-rails'
gem 'jquery-turbolinks'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'nprogress-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'pundit'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development
gem 'capistrano3-unicorn', group: :development
gem 'capistrano-rbenv', '~> 2.0', group: :development
gem 'capistrano-sidekiq', group: :development

gem 'sidekiq', '~> 3.3.0'
gem 'whenever'

gem 'devise'
gem 'devise_invitable', '~> 1.3.4'
gem 'simple_token_authentication', '~> 1.0'

gem 'httparty'

# Use bootstrap with autoprefixer for browser specific css
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

gem 'simple_form'


group :development, :test do 
  gem 'capybara'
  gem 'launchy'
  gem 'rb-fsevent'

  gem 'pry-rails'
  gem 'better_errors', '~> 2.1.1'
  gem 'binding_of_caller'
  gem 'rspec-rails'
  gem "factory_girl_rails", "~> 4.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'sqlite3'

end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
