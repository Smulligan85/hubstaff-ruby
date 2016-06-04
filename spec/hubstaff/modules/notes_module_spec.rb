require 'spec_helper'

class Hubstaff::Client
  describe Note do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
    end

    describe '#notes' do
      it "returns a collection of notes" do
        expect(@client.notes("2016-05-23", "2016-05-25")['notes']).to be_an_instance_of(Array)
      end
    end

    describe '#find_note' do
      it "returns a specific note" do
        expect(@client.find_note(716530)).to be_an_instance_of(Hash)
      end
    end

  end
end

