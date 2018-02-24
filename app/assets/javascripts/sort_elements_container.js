class SortElementsContainer {
  constructor(params = {}) {
    let defaultParams = {
      childSelector: '[sortable-element]'
    }
    params = Object.assign(defaultParams, params)

    this._childSelector = params.childSelector
    this._selector = '#'+params.id
    this.setParams()
  }

  setParams() {
    let sortElementsContainer = document.querySelector(this._selector)
    this._tag = sortElementsContainer.tagName
    this._id = sortElementsContainer.id
    this._cssClasses = sortElementsContainer.classList
  }

  get selector() {
    return this._selector.join(' ').trim()
  }

  get node() {
    return this._node
  }

  getElements() {
    let sortElementsContainer = document.querySelector(this._selector)
    return sortElementsContainer.querySelectorAll(this._childSelector)
  }

  createNewContainer() {
    var node = document.createElement(this._tag)
    node.id = this._id
    this._cssClasses.forEach((cssClass) => node.classList.add(cssClass))

    return node
  }

  replace(elements) {
    let currentSortElementsContainer = document.querySelector(this._selector)
    let newSortElementsContainer = this.createNewContainer()
    for (let i = 0; i < elements.length; i++) {
      newSortElementsContainer.appendChild(elements[i])
    }
    currentSortElementsContainer.parentNode.replaceChild(newSortElementsContainer, currentSortElementsContainer)
  }
}
