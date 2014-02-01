source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'
gem 'sqlite3'
gem 'mysql2'
gem 'jquery-rails'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'rolify'
gem 'simple_form'
gem 'slim'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'zurb-foundation'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
  gem 'jquery-ui-sass-rails'
  gem "font-awesome-rails", "~> 3.2.1.3"  #Handles tying Font Awesome files into Asset Pipeline
end
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'  #, :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'webrick', '1.3.1'  # fixes "could not determine content-length" console errors
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :production do
  gem 'thin'
end
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'launchy'
end
