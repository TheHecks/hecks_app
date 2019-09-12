require 'spec_helper'

App = HecksApp::ApplicationPort

App.config do
  domain SoccerSeason
  driver :Dynamodb
end

describe App do
  let(:red_team) { App[:Teams].default(name: 'redteam').tap(&:save).as_json.deep_symbolize_keys }
  let(:blue_team) { App[:Teams].default(name: 'blueteam').tap(&:save).as_json.deep_symbolize_keys }

  let(:player) do
    App[:Players].default(name: 'Chris', team: red_team).tap(&:save)
  end

  let(:pitch) { App[:Pitches].default(name: 'backyard').tap(&:save) }

  let(:fixture) do
    {
      season: 'summer',
      date: Date.today,
      time: Time.now
    }
  end

  let(:match) do
    App[:Matches].default(
      fixture: fixture,
      teams: [red_team, blue_team],
      pitch: pitch.as_json.deep_symbolize_keys
    ).tap(&:save)
  end

  describe '#add_team!' do
    context('Violating Invariants') do
      let(:match_with_identical_teams) do
        App[:Matches].default(
          fixture: fixture,
          teams: [red_team, red_team],
          pitch: pitch.as_json.deep_symbolize_keys
        )
      end

      it do
        errors = nil
        App[match_with_identical_teams].save do |result|
          result.on_fail do
            errors = result.errors
          end
        end

        expect(errors).to eq ['Teams must be different']
      end
    end
  end

  describe '#save' do
    it '' do
      match.add_goal!(player: player, time: Time.now)
      match.score!
      match.save

      expect(
        App[:Matches].fetch(match)
        .goals.count
      ).to eq 1
    end
  end
end
