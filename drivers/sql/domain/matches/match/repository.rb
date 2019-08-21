module SoccerSeason
  module Matches
    class Match
      class Repository
        Matches = SQL::Database::Matches
        Teams = SQL::Database::Teams

        def save(match)
          record = Matches::Match.new(
            fixture: Matches::Fixture.new(
              season: match.fixture.season,
              date: match.fixture.date,
              time: match.fixture.time
            ),
            teams: match.teams.map do |team|
              Teams::Team.find(team.id)
            end,
            goals: match.goals.map do |goal|
              Matches::Goal.new(
                time: goal.time,
                player_id: goal.player.id
              )
            end,
            result: Matches::Result.new(
              loser: Teams::Team.find_by(id: match.result.try(:loser).try(:id)),
              winner: Teams::Team.find_by(id: match.result.try(:winner).try(:id))
            )
          ).save
        end
      end
    end
  end
end