source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6', '>= 5.1.6.1'
#gem 'rails', '~> 6.0.0', '>= 6.0.0'
# Use Puma as the app server
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
 gem 'bcrypt', '~> 3.1.7'

# Added Devise Gem 3/4/2019
gem 'devise'
# Added responders 9/26/2019
gem 'responders', '2.4.1'
# Added OmniAuth Gem 3/5/2019
gem 'omniauth', '>= 1.0.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :production do
  # Use mysql as the database for Active Record
  # downgraded MySQL Gem 3/2/2019
  # UPgraded MySQL Gem 9/19/2019
  # DOWNgraded MySQL Gem 9/19/2019
  gem 'mysql2', '0.3.21'
end
group :test do
  # Use sqlite3 as the database for Active Record
  #gem 'sqlite3'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem

gem "tzinfo-data", "~> 1.2019"
