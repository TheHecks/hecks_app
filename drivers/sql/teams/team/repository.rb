require_relative 'repository/team'

module SoccerSeason
  module Teams
    class Team
      class Repository
        def save(team)
          Team.new(
            name: team.name
          ).save
        end
      end
    end
  end
end