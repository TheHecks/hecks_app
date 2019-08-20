module SoccerSeason
  module Matches
    class Match
      class Repository
        Matches = SQL::Database::Matches
        def save(match)
          Matches::Match.new(
            fixture: Matches::Fixture.new(
              season: match.fixture.season,
              date: match.fixture.date,
              time: match.fixture.time
            ),
            teams: match.teams.map do |team|
              Teams::Team::Repository::Team.find(team.id)
            end,
            goals: match.goals.map do |goal|
              Matches::Goal.new(
                time: goal.time,
                player_id: goal.player.id
              )
            end,
            result: Matches::Result.new(
              loser: match.result.try(:loser).try(:id),
              winner: match.result.try(:winner).try(:id)
            )
          ).save
        end
      end
    end
  end
end