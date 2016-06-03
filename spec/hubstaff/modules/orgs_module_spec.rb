require 'spec_helper'

class Hubstaff::Client
  describe Organization do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
    end

    describe '#organizations' do
      it "returns a collection of organizations" do
        expect(@client.organizations['organizations']).to be_an_instance_of(Array)
      end
    end

    describe '#find_organization' do
      it "returns a specific organization" do
        expect(@client.find_organization(27572)).to be_an_instance_of(Hash)
      end
    end

    describe "find_org_projects" do
      it "returns active projects for a specific organization" do
        expect(@client.find_org_projects(27572)).to be_an_instance_of(Hash)
      end
    end

    describe "find_org_members" do
      it "returns a collection of users that are members of a specific org" do
        expect(@client.find_org_members(27572)['users']).to be_an_instance_of(Array)
      end
    end
  end
end
