require_relative 'repository/team'

module SoccerSeason
  module Teams
    class Team
      Teams = SQL::Database::Teams
      class Repository
        def save(team)
          Teams::Team.new(
            name: team.name
          ).tap do |record|
            record.save
            team.send(:record=, record)
            team.send(:id=, record.id)
          end
        end
      end
    end
  end
end