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

  attr_reader :auth_token

  def initialize(email, password, auth_token=nil)
    @auth_token = auth_token || self.authenticate_client_and_return_auth_token(email, password)
  end

  def authenticate_client_and_return_auth_token(email, password)
    response ||= Faraday.post do |req|
      req.url "https://api.hubstaff.com/v1/auth"
      req.headers['Content-Type'] = 'application/json'
      req.headers['App-Token'] = ENV['APP_TOKEN']
      req.params['email'] = email
      req.params['password'] = password
    end
    auth_token = JSON.parse(response.body)['user']['auth_token']
    auth_token
  end

  def connection
    Faraday.new(:url => "https://api.hubstaff.com/v1/") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['User-Agent'] = "Hubstaff-Ruby v#{Hubstaff::VERSION}"
      req.headers['Auth-Token'] = self.auth_token
      req.headers['App-Token'] = ENV['APP_TOKEN']
      req.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(connection.get(url).body)
  end
end
