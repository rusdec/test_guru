class GithubGist

  URL = 'https://api.github.com/gists'
  AUTH_KEY = ' 20347c9829489c7d5743e9607f3506113b31a6a6'

  def initialize
    @http_client = Faraday.new(URL)
  end

  def create
    @http_client.post do |request|
      request.headers['Content-Type'] = 'application/json'
      request.headers['Authorization'] = "token #{AUTH_KEY}"
      request.body = create_params
    end 
  end

  private

  def create_params
    {
      description: "the description for this gist",
      public: true,
      files: {
        'file1.txt': {
          content: "String file contents"
        }
      }
    }.to_json
  end
end
