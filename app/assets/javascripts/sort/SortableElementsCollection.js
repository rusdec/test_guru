class SortableElementsCollection {
  constructor(nodes) {
    this._elements = this.toSortableElements(nodes)
  }

  get elements() {
    return this._elements
  }

  // return array of Nodes
  nodes(elements) {
    elements = (elements === undefined) ? this._elements : elements
    let nodes = [];
    for(let i = 0; i < elements.length; i++) {
      nodes.push(elements[i].node)
    }

    return nodes;
  }

  // return array of SortableElement objects
  toSortableElements(nodes) {
    let elements = []
    for(let i = 0; i < nodes.length; i++) {
      elements.push(this.toSortableElement(nodes[i]))
    }
    return elements;
  }

  toSortableElement(node) {
    return new SortableElement(node)
  }

  sort(by, type) {
    var that = this
    return this.nodes(this._elements.sort(function(x, y) {
      x = that.getValue(x[by])
      y = that.getValue(y[by])
      if (type === 'asc') {
        return (x < y) ? -1 : (x === y) ? 0 : 1;
      } else {
        return (x < y) ? 1 : (x === y) ? 0 : -1;
      }
    }));
  }

  getValue(element) {
    return Number.isNaN(Number.parseFloat(element)) ? element : Number.parseFloat(element)
  }
}
