module TestsHelper
  def test_authors(authors)
    authors.map do |author|
      tag.p "#{author.full_name}"
    end.join.html_safe
  end

  # elements [ {sort_by: string, title: string, sort_element_type: numeric|alpha, hidden: asc|desc} ... ]
  def sort_buttons(element)
    buttons = []
    sort_types = ['asc', 'desc']
    arrows = {
      'asc': 'up',
      'desc': 'down'
    }

    sort_types.each do |sort_type|
      css_class = "dropdown-item small #{sort_type == element[:hidden] ? 'hidden' : ''}"
      buttons << button_tag('type': 'button',
                            'class': css_class,
                            'sort-by': element[:sort_by],
                            'sort-button': '',
                            'sort-type': sort_type) do
                              css_class = "fas fa-sort-#{element[:sort_element_type]}-#{arrows[sort_type.to_sym]}"
                              [ element[:title],
                                tag.i(class: css_class) ].join(' ').html_safe
                            end
    end

    buttons.join('').html_safe
  end
end
