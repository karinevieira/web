import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ruby-ui--combobox-select-all"
export default class extends Controller {
  static targets = [
    "parent",
    "child"
  ]

  connect() {
    this.#uncheckAllTargets()
  }

  toggleChilden() {
    const isChecked = this.parentTarget.checked;
    this.childTargets.forEach(child => child.checked = isChecked);
  }

  toggleParent() {
    this.parentTarget.checked = !this.childTargets.some(child => !child.checked);
  }

  #uncheckAllTargets() {
    this.childTargets.forEach(child => child.checked = false)
    if (this.hasParentTarget) this.parentTarget.checked = false
  }
}
