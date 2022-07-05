import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["removeCheckBox", "removeButton"]

  checked() {
    if (this.removeButtonTarget.disabled == true) {
      this.removeButtonTarget.disabled = false
    } else {
      this.removeButtonTarget.disabled = true
    }
  }
}
