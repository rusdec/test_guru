document.addEventListener('turbolinks:load', function() {
  var cardsContainer = document.querySelector('div.cards-container')
  var cards = cardsContainer.querySelectorAll('div.sorted-card')
  cards = new CardCollection(Array.prototype.slice.call(cards))
  
  $('.sort-panel [sort-by="title-asc"]').on('click', () => { sortByTitleAsc(cards) })
  $('.sort-panel [sort-by="title-desc"]').on('click', () => { sortByTitleDesc(cards) })
  $('.sort-panel [sort-by="level-asc"]').on('click', () => { sortByLevelAsc(cards) })
  $('.sort-panel [sort-by="level-desc"]').on('click', () => { sortByLevelDesc(cards) })

  function sortByTitleAsc(cards) {
    cards.sortByTitleAsc()
    renderNewCardsContainer(cards.nodes())
  }

  function sortByTitleDesc(cards) {
    cards.sortByTitleDesc()
    renderNewCardsContainer(cards.nodes())
  }

  function sortByLevelAsc(cards) {
    cards.sortByLevelAsc()
    renderNewCardsContainer(cards.nodes())
  }

  function sortByLevelDesc(cards) {
    cards.sortByLevelDesc()
    renderNewCardsContainer(cards.nodes())
  }

  function renderNewCardsContainer(cards) {
    let cardsContainer = document.querySelector('div.cards-container')
    let newCardsContainer = new CardsContainer({cssClasses: ['row', 'cards-container']})
    newCardsContainer.addCards(cards)
    cardsContainer.parentNode.replaceChild(newCardsContainer.node, cardsContainer)
  }

});

