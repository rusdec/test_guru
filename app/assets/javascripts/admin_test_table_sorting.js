document.addEventListener('turbolinks:load', function() {

  if (document.querySelector('#test-admin-table-container') !== null) {
    var buttons = new SortButtons({
      container: new SortableElementsContainer({id: 'test-admin-table-container'}),
      selector: 'thead [sort-button]'
    }).listen()
  }
});
