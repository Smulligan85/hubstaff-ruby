Dir[File.join(__dir__, 'modules', '*.rb')].each {|file| require file }

class Hubstaff::Client
  include User
  include Organization
  include Project
  include Activity
  include Screenshot
  include Note
  include Weekly
  include Task
  include Custom

  attr_accessor :auth_token, :app_token

  def initialize(app_token)
    @app_token = app_token
  end

  def authenticate(email, password)
    response ||= auth_conn.post do |req|
      req.headers['App-Token'] = self.app_token
      req.body = { email: email, password: password }
    end
    self.auth_token = JSON.parse(response.body)['user']['auth_token']
  end

  def auth_conn
    Faraday.new(:url => "https://api.hubstaff.com/v1/auth") do |req|
      req.request :multipart
      req.request :url_encoded
      req.adapter Faraday.default_adapter
    end
  end

  def connection
    Faraday.new(:url => "https://api.hubstaff.com/v1/") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['User-Agent'] = "Hubstaff-Ruby v#{Hubstaff::VERSION}"
      req.headers['Auth-Token'] = self.auth_token
      req.headers['App-Token'] = self.app_token
      req.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(connection.get(url).body)
  end
end
