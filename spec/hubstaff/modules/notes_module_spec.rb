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

      it "returns a collection of notes for a specific organization" do
        expect(@client.notes("2016-05-23", "2016-05-25", orgs: "27572")["notes"][0]["description"]).to eq("Practice Notes")
      end

      it "returns a collection of notes for a specific project" do
        expect(@client.notes("2016-05-23", "2016-05-25", projects: "112761")["notes"][0]["description"]).to eq("Practice Notes")
      end

      it "returns a collection of notes for a specific user" do
        expect(@client.notes("2016-05-23", "2016-05-25", users: "61188")["notes"][0]["description"]).to eq("Practice Notes")
      end

      it "returns a collection of notes with a offset" do
        expect(@client.notes("2016-05-23", "2016-05-25", offset: 0)["notes"][0]["description"]).to eq("Practice Notes")
      end
    end

    describe '#find_note' do
      it "returns a specific note" do
        expect(@client.find_note(716530)["note"]["description"]).to eq("Practice Notes")
      end
    end

  end
end
