class SortButton {
  constructor(node) {
    this._node = node
    this._inverseSortType = {asc:'desc',desc:'asc'}
  }

  get node() {
    return this._node
  }

  sortType() {
    return this._node.getAttribute('sort-type')
  }

  sortBy() {
    return this._node.getAttribute('sort-by')
  }

  inverseSortType() {
    return this._inverseSortType[this.sortType()]
  }

  hide() {
    if(!this.isHidden()) {
      this._node.classList.add('hidden')
    }
  }

  show() {
    if (this.isHidden()) {
      this._node.classList.remove('hidden')
    }
  }

  isHidden() {
    return this._node.classList.contains('hidden')
  }
}
