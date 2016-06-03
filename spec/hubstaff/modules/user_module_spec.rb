require 'spec_helper'

class Hubstaff::Client
  describe User do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
    end

    describe "#users" do
      it "returns a collection of users" do
        expect(@client.users['users']).to be_an_instance_of(Array)
      end

      it "contains the correct data" do
        expect(@client.users['users'][0]['email']).to eq(ENV['APP_EMAIL'])
      end

      it "returns organizations if org_member is set to true" do
        expect(@client.users(true, false)['users'][0]['organizations']).to be_an_instance_of(Array)
      end

      it "returns projects if project_member is set to true" do
        expect(@client.users(false, true)['users'][0]['projects']).to be_an_instance_of(Array)
      end
    end

    describe "#find_user" do
      it "returns a specific user in a hash" do
        expect(@client.find_user(61188)).to be_an_instance_of(Hash)
      end
    end

    describe "#find_user_orgs" do
      it "returns all user orgs in a array" do
        expect(@client.find_user_orgs(61188)['organizations']).to be_an_instance_of(Array)
      end
    end

    describe "#find_user_projects" do
      it "returns all user projects in a array" do
        expect(@client.find_user_projects(61188)['projects']).to be_an_instance_of(Array)
      end
    end
  end
end
