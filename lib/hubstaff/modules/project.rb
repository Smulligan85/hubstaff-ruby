require 'faraday'
require 'json'

class Hubstaff::Client
  module Project

    def projects(active=nil)
      if active == "active" || active == "archived"
        @projects = get_project("projects?status=#{active}")
      else
        @projects = get_project("projects")
      end
    end

    def find_project(project_id)
      @project = get_project("projects/#{project_id}")
    end

    def find_project_members(project_id)
      @members = get_project("projects/#{project_id}/members")
    end

    private

    def connection
      Faraday.new(:url => "https://api.hubstaff.com/v1") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['User-Agent'] = "Hubstaff-Ruby v#{Hubstaff::VERSION}"
        req.headers['Auth-Token'] = self.auth_token
        req.headers['App-Token'] = ENV['APP_TOKEN']
        req.adapter Faraday.default_adapter
      end
    end

    def get_project(url)
      JSON.parse(connection.get(url).body)
    end
  end
end
