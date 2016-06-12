class Hubstaff::Client
  module Activity

    def activities(start_time, stop_time, options={})
      @activity = connection.get("activities") do |req|
        req.params['start_time'] = start_time
        req.params['stop_time'] = stop_time
        req.params['organizations'] = options[:orgs] unless options[:orgs].nil?
        req.params['projects'] = options[:projects] unless options[:projects].nil?
        req.params['users'] = options[:users] unless options[:users].nil?
        req.params['offset'] = options[:offset] unless options[:offset].nil?
      end
      @activity_json = JSON.parse(@activity.body)
    end
  end
end
