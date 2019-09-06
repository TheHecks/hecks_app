require 'spec_helper'
require_relative '../drivers/dynamodb'

App = HecksApp::ApplicationPort

App.config do
  domain SoccerSeason
  driver :Dynamodb
end

describe App do
  let(:red_team) { App::Teams.save!(name: 'redteam') }
  let(:blue_team) { App::Teams.save!(name: 'blueteam') }
  let(:player) do
    App::Players.save!(name: 'Chris', team: red_team)
  end

  let(:pitch) { App::Pitches.save!(name: 'backyard') }

  let(:fixture) do
    {
      season: 'summer',
      date: Date.today,
      time: Time.now
    }
  end

  let(:match) do
    App::Matches.save!(
      fixture: fixture,
      teams: [red_team, blue_team],
      pitch: pitch
    )
  end

  describe '#save' do
    it '' do
      result = App::Matches.add_goal!(match, player: player, time: Time.now)
      result = App::Matches.score!(result)
      expect(
        SoccerSeason::Domain::Matches::Match::Repository.fetch(
          SoccerSeason::Domain::Matches::Match.default(result)
        ).goals.count
      ).to eq 1
    end
  end
end
