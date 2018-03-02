class ProgressBar {
  constructor(params) {
    this._container = document.querySelector(params.containerSelector)
    this._total = this._container.dataset.total
    this._current = this._container.dataset.current
    params = this.defaultParams(params)
    this._localization = params.localization
    this._params = params.params
    this._renderBackground = params.renderBackground
  }

  render() {
    let svg = this.createSvg(this._params.svg)
    let bar = this.createBar(this._params.bar)
    let description = this.createDescription(this._params.description)

    if (this._renderBackground === true) {
      console.log(this._params.background)
      let background = this.createBackgroundBar(this._params.background)
      svg.append(background)
    }

    svg.append(bar)
    svg.append(description)
    this._container.append(svg)
  }

  createBackgroundBar(params = {}) {
    return this.createRect(params)
  }

  createBar(params = {}) {
    params.width = this.getProgressPercent()
    return this.createRect(params)
  }

  createRect(params = {}) {
    let rect = this.createSvgElement('rect')
    rect = this.setAttrs(rect, params)

    return rect
  }

  createDescription(params = {}, text = null) {
    let description = this.createSvgElement('text')
    params.y = params.y || this.getDescriptionVerticalCenter()
    description = this.setAttrs(description, params)
    description.append(this.createTspan(text))

    return description
  }

  createTspan(text = null) {
    let tspan = this.createSvgElement('tspan')
    tspan.textContent = text || this.getText()

    return tspan
  }
 
  getText() {
    let text = this._localization.description.text
    text = text.replace(/(.*)%.%(.*)%.%(.*)/,`$1${this._current}$2${this._total}$3`)

    return text
  }

  createSvg(params = {}) {
    let svg = this.createSvgElement('svg')
    svg = this.setAttrs(svg, params)

    return svg
  }

  createSvgElement(tag) {
    return document.createElementNS('http://www.w3.org/2000/svg', tag)
  }

  getProgressPercent() {
    return `${(this._current*100)/this._total}%`
  }

  getDescriptionVerticalCenter() {
    let fontSize = this.pxToFloat(this._params.description['font-size'])
    let barHeight = this.pxToFloat(this._params.bar.height)
    let y = (barHeight/2) + (fontSize/3)

    return `${y}px`;
  }

  /**
   * @param string | '10px'
   * @return float | 10
   */
  pxToFloat(string) {
    return parseFloat(string.slice(0, string.length-2))
  }

  defaultParams(params) {
    //todo: merge
    params.renderBackground = params.renderBackground || true
    params.localization.description.text = params.localization.description.text || 'Question %c% from %t%'
    params.params.background = params.params.background || {}
    params.params.background.width = params.params.background.width || '100%'
    params.params.background.height = params.params.background.height || params.params.bar.height
    params.params.svg = params.params.svg || {}
    params.params.svg.width = params.params.svg.width || '100%'
    params.params.svg.height = params.params.svg.height || params.params.bar.height

    return params
  }
  
  setAttrs(element, attributes) {
    Object.entries(attributes).forEach((param) => { 
      element.setAttribute(param[0], param[1])
    })

    return element
  }
}
