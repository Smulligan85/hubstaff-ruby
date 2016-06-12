require 'spec_helper'

class Hubstaff::Client
  describe Weekly do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
    end

    describe '#weekly_team' do
      it "returns a weekly team report with default settings" do
        expect(@client.weekly_team["organizations"]).to be_an_instance_of(Array)
      end

      it "returns a weekly team report with a specific date in week" do
        expect(@client.weekly_team(date: "2016-05-24")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a weekly team report with a specific orgnaization" do
        expect(@client.weekly_team(date: "2016-05-24", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a weekly team report with a specific project" do
        expect(@client.weekly_team(date: "2016-05-24", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a weekly team report with a specific user" do
        expect(@client.weekly_team(date: "2016-05-24", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
      end
 
    end

    describe '#weekly_my' do
      it "returns a weekly individual report with default settings" do
        expect(@client.weekly_my["organizations"]).to be_an_instance_of(Array)
      end

      it "returns a weekly individual report with a specific date in week" do
        expect(@client.weekly_my(date: "2016-05-24")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a weekly individual report with a specific orgnaization" do
        expect(@client.weekly_my(date: "2016-05-24", orgs: "27572")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a weekly individual report with a specific project" do
        expect(@client.weekly_my(date: "2016-05-24", projects: "112761")["organizations"][0]["name"]).to eq("Hook Engine")
      end

      it "returns a weekly individual report with a specific user" do
        expect(@client.weekly_my(date: "2016-05-24", users: "61188")["organizations"][0]["name"]).to eq("Hook Engine")
      end
    end

  end
end
