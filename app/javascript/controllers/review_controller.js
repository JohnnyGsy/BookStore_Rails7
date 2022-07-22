import { Controller } from "@hotwired/stimulus"


export default class extends Controller {

  static targets = [ 'stars', 'rating']

  addStar(event) {
    this.starsTargets.forEach((elem) => {elem.classList.remove('selected-star')})
    
    for (var i = 0; i < event.target.getAttribute('data-value'); i++) {
      if(this.starsTargets[i].classList.contains('rate-star')) {
        this.starsTargets[i].classList.remove('rate-empty')
      }
    }
  }

  removeStar(event) {
    for (var i = 0; i < 5; i++) {
      if(!this.starsTargets[i].classList.contains('selected-star')) {
        this.starsTargets[i].classList.add('rate-empty')
      }
    }
  }

  setStar(event) {
    for (var i = 0; i < event.target.getAttribute('data-value'); i++) {
      this.starsTargets[i].classList.add('selected-star')
    }
    
    var rating = document.getElementById("review_book_rate")
    rating.setAttribute("value",event.target.getAttribute('data-value'))
  }
  
}