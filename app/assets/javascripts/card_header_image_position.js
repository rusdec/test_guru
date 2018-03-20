document.addEventListener('turbolinks:load', () => {
  var cardHeaderImages = document.querySelectorAll('.card-header img')

  if (cardHeaderImages) {
    randomizeImagePosition()
  }

  function randomizeImagePosition() {
    let verticalInterval = { min: 1, max: 289 }
    let horisontalInterval = { min: 1, max: 49 }
    cardHeaderImages.forEach((image) => {
      image.style.marginTop = randomNumber(verticalInterval)+'px'
      image.style.marginLeft = randomNumber(horisontalInterval)+'px'
    })
  }

  function randomNumber(params) {
    return -(Math.random()*params.max)-params.min
  }
})
