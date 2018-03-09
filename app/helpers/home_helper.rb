module HomeHelper

  # params:         hash
  #   card_title:   string
  #   link_to:      hash
  #     title:      string
  #     path:       string
  #   card_footer:  string
  def admin_menu_card(params)
    card_footer = content_tag :div, params[:card_footer], class: 'card-footer text-muted'
    card_link = link_to params[:link_to][:title], params[:link_to][:path], class: 'btn light-button'
    card_block = content_tag :div, class: 'card-block' do
                  concat(tag.h3(params[:card_title], class: 'card-title'))
                  concat(content_tag(:p, card_link, class: 'card-text'))
                 end
    card = content_tag :div, "#{card_block}#{card_footer}".html_safe, class: 'card'

    content_tag :div, card, class: 'col-md-6 text-xs-center'
  end

end
