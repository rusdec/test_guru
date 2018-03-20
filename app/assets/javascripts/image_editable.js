document.addEventListener('turbolinks:load', () => {
  var imageEditable = document.querySelector('#image-editable')
  var imageInput = document.querySelector('.image-input')

  if (imageEditable && imageInput) {
    imageInput.addEventListener('input', () => {
      imageEditable.setAttribute('src', imageInput.value)
    });
  }
});
