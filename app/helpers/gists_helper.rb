module GistsHelper
  def link_to_question(question)
    link_to truncate(question.body, length: 25), admin_question_path(question), target: '_blank'
  end

  def link_to_gist(url)
    link_to hash_from_url(url), url, target: '_blank'
  end

  def hash_from_url(url)
    url.split('/').last
  end
end
