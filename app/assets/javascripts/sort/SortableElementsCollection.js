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

  sortByDesc(param) {
    var p = param
    return this.nodes(this._elements.sort(function(x, y) {
      x = Number.isNaN(Number.parseFloat(x[p])) ? x[p] : Number.parseFloat(x[p])
      y = Number.isNaN(Number.parseFloat(y[p])) ? y[p] : Number.parseFloat(y[p])

      return (x < y) ? 1 : (x === y) ? 0 : -1;
    }));
  }

  sortByAsc(param) {
    var p = param
    return this.nodes(this._elements.sort(function(x, y) {
      x = Number.isNaN(Number.parseFloat(x[p])) ? x[p] : Number.parseFloat(x[p])
      y = Number.isNaN(Number.parseFloat(y[p])) ? y[p] : Number.parseFloat(y[p])

      return (x < y) ? -1 : (x === y) ? 0 : 1;
    }));
  }
}
