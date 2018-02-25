class SortButtons {
  constructor(params) {
    let defaultParams = {
      selector: '[sort-button]',
    }
    params = Object.assign(defaultParams, params)

    this._selector = params.selector
    this._container = params.container
    this._elements = params.container.elements
    this._buttons = this.toSortButtons(this.findButtons())
  }

  findButtons() {
    return document.querySelectorAll(this._selector)
  }

  toSortButtons(nodes) {
    let buttons = []
    for(let i = 0; i < nodes.length; i++) {
      buttons.push(this.toSortButton(nodes[i]))
    }
    return buttons
  }

  toSortButton(node) {
    return new SortButton(node)
  }

  listen(evnt = 'click') {
    for(let i = 0; i < this._buttons.length; i++) {
      this._buttons[i].node.addEventListener(evnt, () => {
        if (this._buttons[i].sortType() === 'asc') {
          this._container.replace(this._elements.sortByAsc(this._buttons[i].sortBy()))
        } else {
          this._container.replace(this._elements.sortByDesc(this._buttons[i].sortBy()))
        }
        this.replaceButton(this._buttons[i])
      })
    }
  }

  replaceButton(buttonForHide) {
    let buttonForShow = this.findInverseSortTypeButton(buttonForHide)
    if (buttonForShow !== undefined) {
      buttonForHide.hide()
      buttonForShow.show()
    }
  }

  findInverseSortTypeButton(button) {
    return this._buttons.find(function (b) {
      return b.sortType() === button.inverseSortType() && b.sortBy() === button.sortBy()
    });
  }
  
}
