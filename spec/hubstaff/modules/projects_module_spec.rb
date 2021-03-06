require 'spec_helper'

class Hubstaff::Client
  describe Project do
    before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'])
      @client.auth_token = ENV['AUTH_TOKEN']
    end

    describe '#projects' do
      it "returns a collection of projects" do
        VCR.use_cassette 'project/projects' do
          expect(@client.projects['projects']).to be_an_instance_of(Array)
        end
      end

      it "returns only active projects" do
        VCR.use_cassette 'project/projects_active' do
          expect(@client.projects("active")['projects'][0]['name']).to eq("Build Ruby Gem")
        end
      end

      it "returns only archieved projects" do
        VCR.use_cassette 'project/projects_archieved' do
          expect(@client.projects("archieved")['projects']).to be_an_instance_of(Array)
        end
      end
    end

    describe '#find_project' do
      it "returns a specific project" do
        VCR.use_cassette 'project/find_project' do
          expect(@client.find_project(112761)).to be_an_instance_of(Hash)
        end
      end
    end

    describe '#find_project_members' do
      it "returns a collection of members for a specific project" do
        VCR.use_cassette 'project/find_project_members' do
          expect(@client.find_project_members(112761)['users']).to be_an_instance_of(Array)
        end
      end
    end
  end
end
