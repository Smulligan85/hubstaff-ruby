# require 'spec_helper'
#
# class Hubstaff::Client
#   describe Task do
#     before(:each) do
#       @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'], ENV['AUTH_TOKEN'])
#     end
#
#     describe '#tasks' do
#       it "returns a collection of tasks" do
#         expect(@client.tasks).to be_an_instance_of(Array)
#       end
#
#       it "returns a collection of tasks for a specific project" do
#         expect(@client.tasks(projects: "112761")).to be_an_instance_of(Hash)
#       end
#
#       it "returns a collection of tasks with a offset" do
#         expect(@client.tasks(offset: 0)).to be_an_instance_of(Hash)
#       end
#     end
#
#     describe '#find_task' do
#       it "returns a specific task" do
#         expect(@client.find_task(716530)).to be_an_instance_of(Hash)
#       end
#     end
#
#   end
# end
