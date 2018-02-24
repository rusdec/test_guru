document.addEventListener('turbolinks:load', function() {

  if (document.querySelector('#test-cards-container') !== null) {
    var testCardsContainer = new SortElementsContainer({id: 'test-cards-container'})
    var elements = new SortElementsCollection(Array.prototype.slice.call(testCardsContainer.getElements()))
      
    $('.sort-panel [sort-by="title-asc"]').on('click',  () => {testCardsContainer.replace(elements.sortByAsc('title'))})
    $('.sort-panel [sort-by="title-desc"]').on('click', () => {testCardsContainer.replace(elements.sortByDesc('title'))})
    $('.sort-panel [sort-by="level-asc"]').on('click',  () => {testCardsContainer.replace(elements.sortByAsc('level'))})
    $('.sort-panel [sort-by="level-desc"]').on('click', () => {testCardsContainer.replace(elements.sortByDesc('level'))})
    $('.sort-panel [sort-by="popularity-asc"]').on('click',  () => {testCardsContainer.replace(elements.sortByAsc('popularity'))})
    $('.sort-panel [sort-by="popularity-desc"]').on('click', () => {testCardsContainer.replace(elements.sortByDesc('popularity'))})
  }

});
