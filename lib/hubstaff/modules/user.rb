require 'faraday'
require 'json'

class Hubstaff::Client
  module User

    def users(org_member=false, project_member=false)
      @users = connection.get("users") do |req|
        req.params['organization_memberships'] = org_member
        req.params['project_memberships'] = project_member
      end
      @users_json = JSON.parse(@users.body)
    end

    def find_user(user_id)
      @user = get_user("users/#{user_id}")
    end

    def find_user_orgs(user_id)
      @user_orgs = get_user("users/#{user_id}/organizations")
    end

    def find_user_projects(user_id)
      @user_projects = get_user("users/#{user_id}/projects")
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
