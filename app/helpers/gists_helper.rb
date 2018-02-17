module GistsHelper
  def link_to_question(question)
    tag.a "#{question.body.slice(0..24)}...",
          href: admin_question_path(question),
          target: '_blank'
  end

  def link_to_gist(url)
    tag.a hash_from_url(url),
          href: url,
          target: '_blank'
  end

  def hash_from_url(url)
    url.split('/').last
  end
end
