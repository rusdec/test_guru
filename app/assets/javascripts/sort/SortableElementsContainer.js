class SortableElementsContainer {
  constructor(params = {}) {
    if (params.id === null)
      throw new Error('[SortableElementsContainer]: Params.id is null')

    this._selector = '#'+params.id
    if (document.querySelector(this._selector) === null)
      throw new Error(`[SortableElementsContainer]: Element with id "${params.id}" not found`)

    let defaultParams = {
      elementsSelector: '[sortable-element]'
    }
    params = Object.assign(defaultParams, params)

    this._elementsSelector = params.elementsSelector
    this.setParams()
    if (params.elements == null) {
      var elements = Array.prototype.slice.call(this.getElements())
    } else {
      var elements = params.elements
    }
    this._elements = new SortableElementsCollection(elements)
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
  
  get elements() {
    return this._elements
  }

  getElements() {
    let sortElementsContainer = document.querySelector(this._selector)
    return sortElementsContainer.querySelectorAll(this._elementsSelector)
  }

  createNewContainer() {
    var node = document.createElement(this._tag)
    node.id = this._id
    this._cssClasses.forEach((cssClass) => node.classList.add(cssClass))

    return node
  }

  replace(elements) {
    if (elements.length > 0) {
      let currentSortElementsContainer = document.querySelector(this._selector)
      let newSortElementsContainer = this.createNewContainer()
      for (let i = 0; i < elements.length; i++) {
        newSortElementsContainer.appendChild(elements[i])
      }
      currentSortElementsContainer.parentNode.replaceChild(newSortElementsContainer, currentSortElementsContainer)
    }
  }
}
