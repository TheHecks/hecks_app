module SoccerSeason
  module Matches
    class Match
      class Repository
        class Result < SQL::Database::Matches::Base
          belongs_to :winner
          belongs_to :loser
        end
      end
    end
  end
end