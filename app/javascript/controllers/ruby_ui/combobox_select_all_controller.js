import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ruby-ui--combobox-select-all"
export default class extends Controller {
  static targets = [
    "parent",
    "child"
  ]

  connect() {
    if (this.hasChildTarget) {
      this.childTargets.map(x => x.checked = false)
    }
    if (this.hasParentTarget) {
      this.parentTarget.checked = false
    }
  }

  toggleChilden() {
    if (this.parentTarget.checked) {
      this.childTargets.map(x => x.checked = true)
    } else {
      this.childTargets.map(x => x.checked = false)
    }
  }

  toggleParent() {
    if (this.childTargets.map(x => x.checked).includes(false)) {
      this.parentTarget.checked = false
    } else {
      this.parentTarget.checked = true
    }
  }
}
