class GistQuestionService
  
  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || GithubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "Вопрос теста #{@test.title}",
      public: true,
      files: {
        'test-guru-question': {
          content: "#{@question.body}"
        }
      }
    }
  end

  def gist_content
    question = [@question.body]
    question << @question.answers.pluck(:body)
    question.join("\n")
  end
end
