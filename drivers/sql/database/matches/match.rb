module SQL
  module Database
    module Matches
      class Match < Base
        has_one :result
        belongs_to :fixture
        has_many :goals
        has_and_belongs_to_many :teams, class_name: 'SoccerSeason::Teams::Team::Repository::Team'
      end
    end
  end
end
