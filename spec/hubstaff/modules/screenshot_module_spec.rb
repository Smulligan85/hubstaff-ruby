# require 'spec_helper'
#
# class Hubstaff::Client
#   describe Screenshot do
#     before(:each) do
#       @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
#     end
#
#     describe '#screenshots' do
#       it "returns a collection of screenshots" do
#       expect(@client.screenshots("2016-05-24", "2016-05-24")).to be_an_instance_of(Hash)
#       end
#     end
#   end
# end