import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "shippingAddressForm" ]


  checked() {
    if (this.shippingAddressFormTarget.hidden == false) {
      this.shippingAddressFormTarget.hidden = true
    } else {
      this.shippingAddressFormTarget.hidden = false
    }
  }


}
