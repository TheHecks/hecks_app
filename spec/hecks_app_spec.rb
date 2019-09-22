require 'spec_helper'
describe HecksApp do
  describe 'config' do
    describe '#adapter' do

      let(:adapter_instance) { double(:adapter_instance) }

      before do
        class_double("SomeAdapter").
        as_stubbed_const

        allow(SomeAdapter).to receive(:new).and_return(adapter_instance)
      end

      it 'expects the adapter to have a #load method' do
        expect(adapter_instance).to receive(:load)
        HecksApp::ApplicationPort.config { adapter :SomeAdapter }
        expect(
          HecksApp::ApplicationPort.instance.adapters
        ).to eq [adapter_instance]
      end
    end
  end
end