class Hubstaff::Client
  module Screenshot

    def screenshots(start_time, stop_time, options={})
        @screenshot = connection.get("screenshots") do |req|
          req.params['start_time'] = start_time
          req.params['stop_time'] = stop_time
          req.params['organizations'] = options[:orgs] unless options[:orgs].nil?
          req.params['projects'] = options[:projects] unless options[:projects].nil?
          req.params['users'] = options[:users] unless options[:users].nil?
          req.params['offset'] = options[:offset] unless options[:offset].nil?
        end
        @screenshot_json = JSON.parse(@screenshot.body)
    end
  end
end
