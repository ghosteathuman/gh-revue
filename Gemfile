source "https://rubygems.org"

ruby File.read(".ruby-version").strip

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
# Full-stack web application framework. (https://rubyonrails.org)
gem "rails", "~> 6.1.0", ">= 6.1.0"
# Use Puma as the app server
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications (https://puma.io)
gem "puma", "~> 5.0"
# Use SCSS for stylesheets
# Sass adapter for the Rails asset pipeline. (https://github.com/rails/sass-rails)
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# Use webpack to manage app-like JavaScript modules in Rails (https://github.com/rails/webpacker)
gem "webpacker", "~> 5.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# Turbolinks makes navigating your web application faster (https://github.com/turbolinks/turbolinks)
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# Create JSON structures via a Builder-style DSL (https://github.com/rails/jbuilder)
gem "jbuilder", "~> 2.7"
# Higher-level data structures built on Redis. (https://github.com/rails/kredis)
gem "kredis", "0.2.3"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
# Boot large ruby/rails apps faster (https://github.com/Shopify/bootsnap)
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Ruby fast debugger - base + CLI (https://github.com/deivid-rodriguez/byebug)
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  # Security vulnerability scanner for Ruby on Rails. (https://brakemanscanner.org)
  gem "brakeman", "~> 5.0"
  # Ruby Style Guide, with linter &amp; automatic code fixer (https://github.com/testdouble/standard)
  gem "standard", github: "testdouble/standard", branch: "master"
  # Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites (http://github.com/colszowka/simplecov)
  # Code coverage for Ruby (https://github.com/simplecov-ruby/simplecov)
  gem "simplecov"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # A debugging tool for your Ruby on Rails applications. (https://github.com/rails/web-console)
  gem "web-console", ">= 4.1.0"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # Profiles loading speed for rack applications. (https://miniprofiler.com)
  gem "rack-mini-profiler", "~> 2.0"
  # Listen to file modifications (https://github.com/guard/listen)
  gem "listen", "~> 3.3"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  # Capybara aims to simplify the process of integration testing Rack applications, such as Rails, Sinatra or Merb (https://github.com/teamcapybara/capybara)
  gem "capybara", ">= 3.26"
  # The next generation developer focused tool for automated testing of webapps (https://github.com/SeleniumHQ/selenium)
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  # gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# Timezone Data for TZInfo (https://tzinfo.github.io)
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
