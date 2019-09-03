require 'spec_helper'
require_relative '../drivers/dynamodb'

App = HecksApp::ApplicationPort

App.config do
  domain SoccerSeason
  # driver :Dynamodb
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
    {
      fixture: fixture,
      teams: [red_team, blue_team],
      pitch: pitch
    }
  end

  describe '#save' do
    it '' do
      App::Matches.save!(match)
      App::Matches.add_goal!(match, player: player, time: Time.now)
      App::Matches.score!(match)
    end
  end
end
