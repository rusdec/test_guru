class GithubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  AUTH_KEY = Rails.application.config.github_token

  def initialize
    @http_client = Faraday.new(url: ROOT_ENDPOINT)
  end

  def create_gist(params)
    puts '----'
    puts AUTH_KEY
    puts '----'
    @http_client.post('gists') do |request|
      request.headers['Content-Type'] = 'application/json'
      request.headers['Authorization'] = "token #{AUTH_KEY}"
      request.body = params.to_json
    end 
  end
end
