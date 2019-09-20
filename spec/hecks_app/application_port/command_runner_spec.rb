require 'spec_helper'

describe HecksApp::ApplicationPort::CommandRunner do
  describe '#new' do
    
      it do
        expect(described_class.new(:Matches).runnable).to eq SoccerSeason::Domain::Matches::Root
      end
      
      it do
        expect(described_class.new(Matches: :Result).runnable).to eq SoccerSeason::Domain::Matches::Result
      end
  end
end