require 'rspec'
require 'fileutils'


$: << File.join(File.dirname(__FILE__), '..', 'lib')

require File.join(File.dirname(__FILE__), '..', 'init')

TEST_DATABASE_FILE = File.join(File.dirname(__FILE__), 'test.sqlite3')

# Spec::Runner.configure do |config|
#   
# end

def setup_database
  File.unlink(TEST_DATABASE_FILE) if File.exist?(TEST_DATABASE_FILE)
  ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3", "timeout" => 5000, "database" => TEST_DATABASE_FILE
  )
  create_tables
end

def create_tables
  c = ActiveRecord::Base.connection
  
  c.create_table :sponsors, :force => true do |t|
    t.string :name
    t.string :address
    t.string :city
    t.string :state
    t.string :zip
    t.string :phone
    t.string :fax
    
    t.timestamps
  end
end

setup_database

require File.join(File.dirname(__FILE__), 'models')
