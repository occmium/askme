source 'https://rubygems.org'

ruby '2.5.5'

gem 'rails_12factor'
gem 'rails', '5.2.3'
gem 'jquery-rails'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'uglifier'
gem 'bootsnap', '>= 1.1.0', require: false

group :production do
  gem 'pg', '~> 0.21'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'#, platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end
