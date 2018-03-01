document.addEventListener('turbolinks:load', function() {
  var elements = document.querySelectorAll('.form-inline-link')

  if (elements.length) {
    for (i = 0; i < elements.length; i++) {
      elements[i].addEventListener('click', formInlineLinkHandler)
    }
  }

  var errors = document.querySelector('.resource-errors')
  var editInline = document.querySelector('.edit-inline')

  if (errors && editInline) {
    formLinkHandler(errors.dataset.resourceId)
  }

  function formInlineLinkHandler(event) {
    event.preventDefault();
    var testId = this.dataset.testId
    formLinkHandler(testId)
  }

  function formLinkHandler(id) {
    var dataSelector = `[data-test-id="${id}"]`
    var link = document.querySelector(`.form-inline-link${dataSelector}`)
    var form = document.querySelector(`.form-inline${dataSelector}`)
    var title = document.querySelector(`.test-title${dataSelector}`)

    if (form.classList.contains('hidden')) {
      title.classList.add('hidden');
      form.classList.remove('hidden');
      link.textContent = "Отменить";
    } else {
      title.classList.remove('hidden');
      form.classList.add('hidden');
      link.textContent = "Редакт. быстр."
    }
  }

});
