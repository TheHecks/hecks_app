require "active_record"
require_relative 'sql/database/matches/base'
require_relative 'sql/database/teams/base'
require_relative 'sql/domain/matches/match'
require_relative 'sql/domain/teams/team'
require_relative 'sql/domain/matches/match/repository'
require_relative 'sql/domain/teams/team/repository'
require_relative 'sql/migrate.rb'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: "drivers/sql/database/soccer_season"
CreateDatabase.new.up
