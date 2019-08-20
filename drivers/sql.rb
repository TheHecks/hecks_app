require "active_record"
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: "soccer_season"

require_relative 'sql/matches_ar'
require_relative 'sql/teams_ar'

require_relative 'sql/matches/match/repository'
require_relative 'sql/teams/team/repository'
require_relative 'sql/migrations/create_matches'
