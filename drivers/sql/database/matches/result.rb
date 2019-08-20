module SQL
  module Database
    module Matches
      class Result < Base
        belongs_to :winner
        belongs_to :loser
      end
    end
  end
end