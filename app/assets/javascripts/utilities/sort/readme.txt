Элементы:

- id

- sort-button
  - sort-type = ['asc'|'desc']
  - sort-by = [string]

- sortable-element
  - sort-by = [string]

Пример:

<div id="my-buttons">
  <span sort-button sort-type="asc" sort-by"number">Asc</sort>
  <span sort-button sort-type="desc" sort-by"number">Desc</desc>
</div>
<div id="my-container">
  <span sortable-element sort-by="number">4</span>
  <span sortable-element sort-by="number">6</span>
  <span sortable-element sort-by="number">2</span>
</div>

<script>
  var buttons = new SortButtons({
    container: new SortableElementsContainer({id:'my-container'}),
    selector: '#my-buttons [sort-button]'
  })
  buttons.listen()
</script>
