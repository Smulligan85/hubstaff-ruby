require 'faraday'
require 'json'

class Hubstaff::Client
  module Activity

    def activities(start_time, end_time, orgs="", projects="", users="", offset=0)
      @activity = connection.get("activities") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = end_time
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
        req.params['offset'] = offset
      end
      @activity_json = JSON.parse(@activity.body)
    end

    private

    def connection
      Faraday.new(:url => "https://api.hubstaff.com/v1/") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['User-Agent'] = "Hubstaff-Ruby v#{Hubstaff::VERSION}"
        req.headers['Auth-Token'] = self.auth_token
        req.headers['App-Token'] = ENV['APP_TOKEN']
        req.adapter Faraday.default_adapter
      end
    end

  end
end
