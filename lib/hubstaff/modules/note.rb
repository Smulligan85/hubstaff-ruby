require 'pry'
require 'faraday'
require 'json'

class Hubstaff::Client
  module Note

    def notes(start_time, end_time, orgs="", projects="", users="", offset=0)
      @notes = connection.get("notes") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = end_time
        req.params['organizations'] = orgs unless orgs.empty?
        req.params['projects'] = projects unless projects.empty?
        req.params['users'] = users unless users.empty?
        req.params['offset'] = offset
      end
      @note_json = JSON.parse(@notes.body)
    end

    def find_note(note_id)
      @note = get_note("notes/#{note_id}")
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

    def get_note(url)
      JSON.parse(connection.get(url).body)
    end

  end
end

