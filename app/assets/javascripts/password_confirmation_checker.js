document.addEventListener('turbolinks:load', function() {
  if (document.querySelector('#new_user') !== null) {
    var passwordField = document.querySelector('#user_password')
    var passwordConfirmField = document.querySelector('#user_password_confirmation')
    var minLength = getMinLength(passwordField)

    passwordField.addEventListener('input', function() {
      checkPasswordChangeAndConfirmNotEmpty(passwordField, passwordConfirmField)
      checkPasswordMinLengthRequire(passwordField)
    });

    passwordConfirmField.addEventListener('input', function() {
      checkConfirmEqualPasswordRequire(passwordField, passwordConfirmField)
    })
  }

  function checkConfirmEqualPasswordRequire(passwordField, passwordConfirmField) {
    if(passwordConfirmField.value.length > 0 && passwordConfirmField.value !== passwordField.value) {
      hoverDanger(passwordConfirmField)
    } else if(passwordConfirmField.value.length === 0) {
      hoverClear(passwordConfirmField)
    } else {
      hoverSuccess(passwordConfirmField)
    }
  }

  function checkPasswordChangeAndConfirmNotEmpty(passwordField, passwordConfirmField) {
    if (passwordConfirmField.value.length > 0) {
      checkConfirmEqualPasswordRequire(passwordField, passwordConfirmField)
    }
  }
  function checkPasswordMinLengthRequire(passwordField) {
    if(passwordField.value.length < minLength && passwordField.value.length > 0) {
      hoverDanger(passwordField)
    } else if (passwordField.value.length >= minLength) {
      hoverSuccess(passwordField)
    } else {
      hoverClear(passwordField)
    }
  }

  function getMinLength(field) {
    let minLength = field.parentNode.querySelector('div.min-length').getAttribute('value')
    return Number.parseInt(minLength)
  }

  function addClasses(field, classes) {
    for(let i = 0; i < classes.length; i++) {
      field.classList.add(classes[i])
    }
  }

  function hoverClear(field) {
    field.parentNode.classList = []
    addClasses(field.parentNode, ['form-group'])
    field.classList = []
    addClasses(field, ['form-control'])
  }

  function hoverDanger(field) {
    field.parentNode.classList = []
    addClasses(field.parentNode, ['form-group', 'has-danger'])
    field.classList = []
    addClasses(field, ['form-control', 'form-control-danger'])
  }

  function hoverSuccess(field) {
    field.parentNode.classList = []
    addClasses(field.parentNode, ['form-group', 'has-success'])
    field.classList = []
    addClasses(field, ['form-control', 'form-control-success'])
  }

});
