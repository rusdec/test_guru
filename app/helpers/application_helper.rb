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

  def flash_alert
    flash_message(:alert)
  end

  def flash_message(param)
    content_tag :p, flash[param], class: 'flash alert' if flash[param]
  end

  def welcome_message(user)
    "Добро пожаловать, гуру #{tag.b user.email}".html_safe
  end
end
