module SQL
  module Database
    module Matches
      class Result < Base
        belongs_to :winner, class_name: 'SQL::Database::Teams::Team'
        belongs_to :loser, class_name: 'SQL::Database::Teams::Team'
        belongs_to :match
      end
    end
  end
end