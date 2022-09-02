import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "output"  ]
  static values = { amount: { type: Number, default: 1 } }


  plus() {
    var currentValue = document.getElementById('order_order_item_quantity')
    currentValue.value++
  }
  
  minus() {
    var currentValue = document.getElementById('order_order_item_quantity')
    if (currentValue.value > 1) currentValue.value--
    
  }


}
