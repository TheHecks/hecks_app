require 'spec_helper'
require_relative '../drivers/dynamodb'

App = HecksApp::ApplicationPort

App.config do
  domain SoccerSeason
  driver :Dynamodb
end

describe App do
  let(:red_team) { App::Teams::Team.default(name: 'redteam').tap(&:save!) }
  let(:blue_team) { App::Teams::Team.default(name: 'blueteam').tap(&:save!) }

  let(:player) do
    App::Players::Player.default(name: 'Chris', team: red_team).tap(&:save!)
  end

  let(:pitch) { App::Pitches::Pitch.default(name: 'backyard').tap(&:save!) }

  let(:fixture) do
    {
      season: 'summer',
      date: Date.today,
      time: Time.now
    }
  end

  let(:match) do
    App::Matches::Match.default(
      fixture: fixture,
      teams: [red_team, blue_team],
      pitch: pitch.as_json.deep_symbolize_keys
    ).tap(&:save!)
  end

  describe '#save' do
    it '' do
      match.add_goal!(player: player, time: Time.now)
      match.score!
      match.save!

      expect(
        SoccerSeason::Domain::Matches::Match::Repository.fetch(match)
        .goals.count
      ).to eq 1
    end
  end
end
