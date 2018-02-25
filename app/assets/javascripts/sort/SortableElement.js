class SortableElement {
  constructor(node) {
    this._node = node
    this.createAttributes()
  }

  createAttributes() {
    let attributes = this._node.querySelectorAll('[sort-by]')
    for (let i = 0; i < attributes.length; i++) {
      this[attributes[i].getAttribute('sort-by')] = attributes[i].innerText
    }
  }

  get node() {
    return this._node
  }
}
