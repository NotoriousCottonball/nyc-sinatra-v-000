require 'bundler/setup'
Bundler.require

ENV["SINATRA_ENV"] ||= "development"

ENV['DATABASE_URL'] ||= "sqlite3://localhost/db/nycdevelopment.sqlite"


ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])



require_relative "../app/controllers/application_controller.rb"

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].sort.each {|f| require f}
