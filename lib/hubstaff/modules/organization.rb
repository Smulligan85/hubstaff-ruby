require 'faraday'
require 'json'

class Hubstaff::Client
  module Organization

    def organizations
      @orgs = get_url("organizations")
    end

    def find_organization(org_id)
      @found_org = get_url("organizations/#{org_id}")
    end

    def find_org_projects(org_id)
      @org_projects = get_url("organizations/#{org_id}/projects")
    end

    def find_org_members(org_id)
      @org_members = get_url("organizations/#{org_id}/members")
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

    def get_url(url)
      JSON.parse(connection.get(url).body)
    end
  end
end
