module SoccerSeason
  module Matches
    class Match
      class Repository
        class Result < MatchesAR
          belongs_to :winner
          belongs_to :loser
        end
      end
    end
  end
end