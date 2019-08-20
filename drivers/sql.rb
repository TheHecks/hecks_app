require 'active_record'
require_relative 'sql/database'
require_relative 'sql/domain'
require_relative 'sql/migrate.rb'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'drivers/sql/soccer_season_db'
)

CreateDatabase.new.up
