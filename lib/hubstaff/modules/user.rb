class Hubstaff::Client
  module User

    def users(org_member=false, project_member=false, offset=0)
      users = connection.get("users") do |req|
        req.params['organization_memberships'] = org_member
        req.params['project_memberships'] = project_member
        req.params['offset'] = offset
      end
      users_json = JSON.parse(users.body)
      users_json
    end

    def find_user(user_id)
      user = get_json("users/#{user_id}")
      user
    end

    def find_user_orgs(user_id, offset=0)
      orgs = connection.get("users/#{user_id}/organizations") do |req|
        req.params['offset'] = offset
      end
      user_orgs = JSON.parse(orgs.body)
      user_orgs
    end

    def find_user_projects(user_id, offset=0)
      projects = connection.get("users/#{user_id}/projects") do |req|
        req.params['offset'] = offset
      end
      user_projects = JSON.parse(projects.body)
      user_projects
    end
  end
end
