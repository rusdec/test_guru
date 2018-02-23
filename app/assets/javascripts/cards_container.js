class CardsContainer {
  constructor(params = {}) {
    let defaultParams = {
      cssClasses: [],
    }
    params = Object.assign(defaultParams, params)

    this._node = document.createElement('div')
    this.addClass(params.cssClasses)
  }

  get node() {
    return this._node
  }

  addClass(cssClasses) {
    for (let i = 0; i < cssClasses.length; i++) {
      this._node.classList.add(cssClasses[i])
    }
  }

  addCards(cards) {
    for (let i = 0; i < cards.length; i++) {
      this.addCard(cards[i])
    }
  }

  addCard(card) {
    this._node.appendChild(card)
  }
}
