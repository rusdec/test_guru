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
    content_tag :div,
                flash_content(message),
                class: "alert #{flash_type(type)} mt-3" if message
  end

  def page_header(header_text)
    content_tag :p, header_text, class: 'h1 text-center p-3'
  end

  private

  def flash_type(type)
    case type
    when 'alert' then 'alert-danger'
    when 'success' then 'alert-success'
    when 'warning' then 'alert-warning'
    else
      'alert-info'
    end
  end

  def flash_content(message)
    "#{message}#{close_button}".html_safe
  end

  def close_button
    '<button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
     </button>'
  end
end
