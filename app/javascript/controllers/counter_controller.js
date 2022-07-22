import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "output" ]
  static values = { amount: { type: Number, default: 1 } }

  connect() {
    this.currentAmount()
  }
  
  plus() {
    this.amountValue++
    this.currentAmount()
  }
  
  minus() {
    if (this.amountValue > 1)
      this.amountValue--
    this.currentAmount()
  }

  currentAmount() {
   this.outputTarget.value = this.amountValue
  }
}
