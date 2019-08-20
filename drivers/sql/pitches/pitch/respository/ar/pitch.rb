module SoccerSeason
  module Pitches
    class Pitch
      class Repository
        module AR
          class Pitch < ActiveRecord::Base
            self.table_name_prefix = 'pitches'
            establish_connection adapter: "sqlite3", database: "soccer_season"
            connection.create_table table_name, force: true do |t|
              t.integer :name
            end
          end
        end
      end
    end
  end
end