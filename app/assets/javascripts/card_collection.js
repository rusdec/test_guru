class CardCollection {
  constructor(nodes) {
    this._cards = this.toCards(nodes)
  }
 
  nodes(cards) {
    cards = (cards === undefined) ? this._cards : cards
    let nodes = [];
    for(let i = 0; i < cards.length; i++) {
      nodes.push(cards[i].node)
    }

    return nodes;
  }

  toCards(nodes) {
    let cards = []
    for(let i = 0; i < nodes.length; i++) {
      cards.push(this.toCard(nodes[i]))
    }
    return cards;
  }

  toCard(node) {
    return new Card(node)
  }

  sortByLevelAsc() {
    this._cards = this._cards.sort(this.compareLevelAsc)
  }

  sortByLevelDesc() {
    this._cards = this._cards.sort(this.compareLevelDesc)
  }

  compareLevelAsc(x, y) {
    x = x.level()
    y = y.level()
    return (x < y) ? -1 : (x === y) ? 0 : 1;
  }

  compareLevelDesc(x, y) {
    x = x.level()
    y = y.level()
    return (x < y) ? 1 : (x === y) ? 0 : -1;
  }

  sortByTitleAsc() {
    this._cards = this._cards.sort(this.compareTitleAsc)
  }

  sortByTitleDesc() {
    this._cards = this._cards.sort(this.compareTitleDesc)
  }

  compareTitleAsc(x, y) {
    x = x.title()
    y = y.title()
    return (x < y) ? -1 : (x === y) ? 0 : 1;
  }

  compareTitleDesc(x, y) {
    x = x.title()
    y = y.title()
    return (x < y) ? 1 : (x === y) ? 0 : -1;
  }
}
