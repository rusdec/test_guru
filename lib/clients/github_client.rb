class GithubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  AUTH_KEY = '4bd71f8facb2a1b5911ddc3d80e4929e0586063a'

  def initialize
    @http_client = Faraday.new(url: ROOT_ENDPOINT)
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Content-Type'] = 'application/json'
      request.headers['Authorization'] = "token #{AUTH_KEY}"
      request.body = params.to_json
    end 
  end
end
