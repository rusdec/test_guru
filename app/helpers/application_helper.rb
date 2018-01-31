module ApplicationHelper
  def current_year
    DateTime.current.year
  end

  def github_url(params)
    url = "//github.com/#{params[:author]}/#{params[:repo]}"

    link_to params[:title], url, target: '_blank'
  end

  def thinknetica_url(title)
    link_to title, '//thinknetica.com/', target: '_blank'
  end

  def flash_messages
    flash.map { |type, message| flash_message(message, type) }.join.html_safe
  end

  def flash_message(message, type)
    content_tag :p, message, class: "flash #{type}" if message
  end

  def welcome_message(user)
    "Добро пожаловать, гуру #{tag.b user.email}".html_safe
  end
end
