require 'faraday'
require 'json'

class Hubstaff::Client
  module User

    def users(org_member=false, project_member=false, offset=0)
      @users = connection.get("users") do |req|
        req.params['organization_memberships'] = org_member
        req.params['project_memberships'] = project_member
        req.params['offset'] = offset
      end
      @users_json = JSON.parse(@users.body)
    end

    def find_user(user_id)
      @user = get_user("users/#{user_id}")
    end

    def find_user_orgs(user_id, offset=0)
      @orgs = connection.get("users/#{user_id}/organizations") do |req|
        req.params['offset'] = offset
      end
      @user_orgs = JSON.parse(@orgs.body)
    end

    def find_user_projects(user_id, offset=0)
      @projects = connection.get("users/#{user_id}/projects") do |req|
        req.params['offset'] = offset
      end
      @user_projects = JSON.parse(@projects.body)
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

    def get_user(url)
      JSON.parse(connection.get(url).body)
    end
  end
end
