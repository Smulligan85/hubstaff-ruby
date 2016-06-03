require 'spec_helper'

module Hubstaff
  describe Client do
    before(:all) do 
      @client = Hubstaff::Client.new(ENV['APP_EMAIL'], ENV['APP_PASSWORD'])
    end
    describe  "#authenticate_client_and_return_auth_token" do
      it "returns the users auth_token" do
        expect(@client.auth_token).to eq(ENV['AUTH_TOKEN'])
      end
    end
  end
end
