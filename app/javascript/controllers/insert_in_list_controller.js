
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]

  send(event) {
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        const firstPost = document.getElementById("first-text")
        const updateCounter = document.getElementById("counter")
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          // firstPost.parentNode.removeChild(firstPost) works if there are no reviews
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
