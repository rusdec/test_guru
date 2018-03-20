module BadgesHelper
  def activity_icon(badge)
    tag.i('', class: 'far fa-check-circle') if badge.active?
  end
end
