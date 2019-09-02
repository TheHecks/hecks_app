require 'spec_helper'
App = ApplicationPort

App.config do
  domain SoccerSeason
end

describe App do
  let(:red_team) do
    App::Teams.save! name: 'redteam'
  end

  let(:blue_team) { App::Teams.save! name: 'blueteam' }
  let(:player) { App::Players.save! name: 'Chris', team: red_team }
  let(:pitch) { App::Matches.save! name: 'backyard' }

  subject do
    App::Matches.save!(
      fixture: {
        season: 'summer',
        date: Date.today,
        time: Time.now
      },
      teams: [red_team, blue_team],
      pitch: pitch
    )
  end

  describe '#save' do
    it '' do
      App::Matches.add_goal!(subject, player: player, time: Time.now)
      App::Matches.score!(subject)
    end
  end
end
