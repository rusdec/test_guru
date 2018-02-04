module TestsHelper
  def test_authors(authors)
    authors.map do |author|
      tag.p "#{author.last_name} #{author.first_name}"
    end.join.html_safe
  end
end
