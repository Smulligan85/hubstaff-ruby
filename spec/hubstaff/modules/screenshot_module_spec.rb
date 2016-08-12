require 'spec_helper'

class Hubstaff::Client
  describe Screenshot do
      before(:each) do
      @client = Hubstaff::Client.new(ENV['APP_TOKEN'],ENV['AUTH_TOKEN'])
    end

    describe '#screenshots' do
      it "returns a collection of screenshots for a specific organization" do
        VCR.use_cassette 'screen/screenshots_org' do
          expect(@client.screenshots("2016-05-22", "2016-05-25", orgs: "27572")).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of screenshots for a specific project" do
        VCR.use_cassette 'screen/screenshots_project' do
          expect(@client.screenshots("2016-05-22", "2016-05-25", projects: "112761")).to be_an_instance_of(Hash)
        end
      end

      it "returns a collection of screenshots for a specific user" do
        VCR.use_cassette 'screen/screenshots_user' do
          expect(@client.screenshots("2016-05-22", "2016-05-25", users: "61188")).to be_an_instance_of(Hash)
        end
      end
    end
  end
end
