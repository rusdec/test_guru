document.addEventListener('turbolinks:load', () => {
  var badge_image = document.querySelector('#badge_editable')
  var badge_input = document.querySelector('#badge_image')

  if (badge_image && badge_input) {
    badge_input.addEventListener('input', () => {
      badge_image.setAttribute('src', badge_input.value)
    });
  }
});
