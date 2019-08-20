require_relative 'repository/match'
require_relative 'repository/tied_result'
require_relative 'repository/fixture'
require_relative 'repository/goal'
require_relative 'repository/match_team'
require_relative 'repository/result'

module SoccerSeason
  module Matches
    class Match
      class Repository
        def save(match)
          Match.new(
            fixture: Fixture.new(
              season: match.fixture.season,
              date: match.fixture.date,
              time: match.fixture.time
            ),
            teams: match.teams.map do |team|
              Teams::Team::Repository::Team.find(team.id)
            end,
            goals: match.goals.map do |goal|
              Goal.new(
                time: goal.time,
                player_id: goal.player.id
              )
            end,
            result: Result.new(
              loser: match.result.try(:loser).try(:id),
              winner: match.result.try(:winner).try(:id)
            )
          ).save
        end
      end
    end
  end
end