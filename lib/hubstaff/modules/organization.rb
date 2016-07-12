class Hubstaff::Client
  module Organization

    def organizations(offset=0)
      orgs = connection.get("organizations") do |req|
        req.params['offset'] = offset
      end
      org_json = JSON.parse(orgs.body)
      org_json
    end

    def find_organization(org_id)
      found_org = get_json("organizations/#{org_id}")
      found_org
    end

    def find_org_projects(org_id, offset=0)
      org_projects = connection.get("organizations/#{org_id}/projects") do |req|
        req.params['offset'] = offset
      end
      org_project_json = JSON.parse(org_projects.body)
      org_project_json
    end

    def find_org_members(org_id, offset=0)
      org_members = connection.get("organizations/#{org_id}/members") do |req|
        req.params['offset'] = offset
      end
      org_member_json = JSON.parse(org_members.body)
      org_member_json
    end
  end
end
