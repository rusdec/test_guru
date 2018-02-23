class Card {
  constructor(node) {
    this._node = node
  }

  get node() {
    return this._node
  }

  title() {
    return this._node.querySelector('.card-title').innerText
  }

  level() {
    return this._node.querySelector('.card-level').innerText
  }
}
