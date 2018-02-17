class GistQuestionService
  
  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.config.github_token)
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "#{I18n.t('.question_of_the_test', test_title: @test.title)}",
      public: true,
      files: {
        'test-guru-question': {
          content: gist_content
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
