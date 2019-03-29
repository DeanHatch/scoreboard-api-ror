
c:\sites\scoreboard_api>rails --help
The most common rails commands are:
 generate     Generate new code (short-cut alias: "g")
 console      Start the Rails console (short-cut alias: "c")
 server       Start the Rails server (short-cut alias: "s")
 test         Run tests except system tests (short-cut alias: "t")
 test:system  Run system tests
 dbconsole    Start a console for the database specified in config/database.yml
              (short-cut alias: "db")

 new          Create a new Rails application. "rails new my_app" creates a
              new application called MyApp in "./my_app"


All commands can be run with -h (or --help) for more information.
In addition to those commands, there are:

Rails:
  console
  dbconsole
  destroy
  generate
  new
  runner
  secrets:edit
  secrets:setup
  server
  test
  version

Rake:
  about
  app:template
  app:update
  db:create
  db:drop
  db:environment:set
  db:fixtures:load
  db:migrate
  db:migrate:status
  db:rollback
  db:schema:cache:clear
  db:schema:cache:dump
  db:schema:dump
  db:schema:load
  db:seed
  db:setup
  db:structure:dump
  db:structure:load
  db:version
  dev:cache
  initializers
  log:clear
  middleware
  notes
  notes:custom
  restart
  routes
  secret
  stats
  test
  test:db
  test:system
  time:zones[country_or_offset]
  tmp:clear
  tmp:create
  yarn:install


c:\sites\scoreboard_api>rails generate --help
Usage: rails generate GENERATOR [args] [options]

General options:
  -h, [--help]     # Print generator's options and usage
  -p, [--pretend]  # Run but do not make any changes
  -f, [--force]    # Overwrite files that already exist
  -s, [--skip]     # Skip files that already exist
  -q, [--quiet]    # Suppress status output

Please choose a generator below.

Rails:
  channel
  controller
  generator
  integration_test
  job
  mailer
  migration
  model
  resource
  scaffold
  scaffold_controller
  system_test
  task

ActiveRecord:
  active_record:migration
  active_record:model

TestUnit:
  test_unit:controller
  test_unit:generator
  test_unit:helper
  test_unit:integration
  test_unit:job
  test_unit:mailer
  test_unit:model
  test_unit:plugin
  test_unit:scaffold
  test_unit:system


c:\sites\scoreboard_api>bundle install
Fetching gem metadata from https://rubygems.org/.............
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 12.3.2
Using concurrent-ruby 1.1.4
Using i18n 1.5.3
Using minitest 5.11.3
Using thread_safe 0.3.6
Using tzinfo 1.2.5
Using activesupport 5.1.6.1
Using builder 3.2.3
Using erubi 1.8.0
Using mini_portile2 2.4.0
Using nokogiri 1.10.1 (x86-mingw32)
Using rails-dom-testing 2.0.3
Using crass 1.0.4
Using loofah 2.2.3
Using rails-html-sanitizer 1.0.4
Using actionview 5.1.6.1
Using rack 2.0.6
Using rack-test 1.1.0
Using actionpack 5.1.6.1
Using nio4r 2.3.1
Using websocket-extensions 0.1.3
Using websocket-driver 0.6.5
Using actioncable 5.1.6.1
Using globalid 0.4.2
Using activejob 5.1.6.1
Using mini_mime 1.0.1
Using mail 2.7.1
Using actionmailer 5.1.6.1
Using activemodel 5.1.6.1
Using arel 8.0.0
Using activerecord 5.1.6.1
Fetching bcrypt 3.1.12 (x86-mingw32)
Installing bcrypt 3.1.12 (x86-mingw32)
Using bundler 2.0.1
Using byebug 11.0.0
Fetching orm_adapter 0.5.0
Installing orm_adapter 0.5.0
Using method_source 0.9.2
Using thor 0.20.3
Using railties 5.1.6.1
Fetching responders 2.4.1
Installing responders 2.4.1
Fetching warden 1.2.8
Installing warden 1.2.8
Fetching devise 4.6.1
Installing devise 4.6.1
Using mysql2 0.3.21 (x86-mingw32)
Using puma 3.12.0
Using sprockets 3.7.2
Using sprockets-rails 3.2.1
Using rails 5.1.6.1
Using tzinfo-data 1.2018.9
Bundle complete! 6 Gemfile dependencies, 47 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

c:\sites\scoreboard_api>rails generate --help
Usage: rails generate GENERATOR [args] [options]

General options:
  -h, [--help]     # Print generator's options and usage
  -p, [--pretend]  # Run but do not make any changes
  -f, [--force]    # Overwrite files that already exist
  -s, [--skip]     # Skip files that already exist
  -q, [--quiet]    # Suppress status output

Please choose a generator below.

Rails:
  channel
  controller
  generator
  integration_test
  job
  mailer
  migration
  model
  resource
  responders_controller
  scaffold
  scaffold_controller
  system_test
  task

ActiveRecord:
  active_record:devise
  active_record:migration
  active_record:model

Devise:
  devise
  devise:controllers
  devise:install
  devise:views

Mongoid:
  mongoid:devise

Responders:
  responders:install

TestUnit:
  test_unit:controller
  test_unit:generator
  test_unit:helper
  test_unit:integration
  test_unit:job
  test_unit:mailer
  test_unit:model
  test_unit:plugin
  test_unit:scaffold
  test_unit:system


c:\sites\scoreboard_api>rails generate devise:install
      create  config/initializers/devise.rb
      create  config/locales/devise.en.yml
===============================================================================

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Her
e
     is an example of default_url_options appropriate for a development environm
ent
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 300
0 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

===============================================================================

c:\sites\scoreboard_api>