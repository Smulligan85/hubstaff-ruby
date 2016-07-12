class Hubstaff::Client
  module Weekly

    def weekly_team(options={})
      weekly_team_report = connection.get("weekly/team") do |req|
        req.params['date'] = options[:date] unless options[:date].nil?
        req.params['organizations'] = options[:orgs] unless options[:orgs].nil?
        req.params['projects'] = options[:projects] unless options[:projects].nil?
        req.params['users'] = options[:users] unless options[:users].nil?
      end
      weekly_team_json = JSON.parse(weekly_team_report.body)
      weekly_team_json
    end

    def weekly_my(options={})
      weekly_my_report = connection.get("weekly/my") do |req|
        req.params['date'] = options[:date] unless options[:date].nil?
        req.params['organizations'] = options[:orgs] unless options[:orgs].nil?
        req.params['projects'] = options[:projects] unless options[:projects].nil?
        req.params['users'] = options[:users] unless options[:users].nil?
      end
      weekly_my_json = JSON.parse(weekly_my_report.body)
      weekly_my_json
    end
  end
end


