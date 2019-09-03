require 'spec_helper'
App = ApplicationPort

App.config do
  domain SoccerSeason
end

describe App do
  let(:red_team) { App::Teams.save!(name: 'redteam') }
  let(:blue_team) { App::Teams.save!(name: 'blueteam') }
  # let(:player) { App::Players.save!(name: 'Chris', team: SoccerSeason::Teams::Team.new(red_team)) }
  let(:pitch) { App::Pitches.save!(name: 'backyard') }
  
  let(:fixture) do
    {
      season: 'summer',
      date: Date.today,
      time: Time.now
    }
  end
  
  let(:match) do
    {
      fixture: fixture,
      teams: [red_team, blue_team],
      pitch: pitch
    }
  end


  describe '#save' do
    it '' do
      App::Matches.save!(match)
      # App::Matches.add_goal!(subject, player: player, time: Time.now)
      # App::Matches.score!(subject)
    end
  end
end
