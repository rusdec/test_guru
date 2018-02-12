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
    flash.map { |klass, message| flash_message(message, klass) }.join.html_safe
  end

  def flash_message(message, klass)
    content_tag :div,
                flash_content(message),
                class: "alert #{flash_class(klass.to_sym)} mt-3" if message
  end

  def page_header(header_text)
    content_tag :p, header_text, class: 'h1 text-center p-3'
  end

  private

  FLASH_KLASSES = {
    alert:    'alert-danger',
    success:  'alert-success',
    warning:  'alert-warning',
    notice:   'alert-info'
  }.freeze

  FLASH_KLASS_DEFAULT = FLASH_KLASSES[:notice]

  def flash_class(klass)
    FLASH_KLASSES[klass] || FLASH_KLASS_DEFAULT
  end

  def flash_content(message)
    "#{message}#{close_button}".html_safe
  end

  def close_button
    button_tag close_symbol,
               type: 'button',
               class: 'close',
               'data-dismiss': 'alert',
               'aria-label': 'Close'
  end

  def close_symbol
    tag.span("&times;".html_safe, aria_hidden: true)
  end
end
