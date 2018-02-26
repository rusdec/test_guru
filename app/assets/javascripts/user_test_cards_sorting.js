document.addEventListener('turbolinks:load', function() {

  if (document.querySelector('#test-cards-container') !== null) {
    var buttons = new SortButtons({
      container: new SortableElementsContainer({id: 'test-cards-container'}),
      selector: '.sort-panel [sort-button]'
    }).listen()
  }
});
