ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'capybara'
require 'rspec/rails'
require 'capybara/rspec'
ActiveRecord::Migration.maintain_test_schema!
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL

  config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  config.infer_spec_type_from_file_location!
end
