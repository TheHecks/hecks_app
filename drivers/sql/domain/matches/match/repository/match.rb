module SoccerSeason
  module Matches
    class Match
      class Repository
        class Match < MatchesAR
          has_one :result
          belongs_to :fixture
          has_many :goals
          has_and_belongs_to_many :teams, class_name: 'SoccerSeason::Teams::Team::Repository::Team'
        end
      end
    end
  end
end