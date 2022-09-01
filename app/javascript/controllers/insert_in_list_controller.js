
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form", "counter"]

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
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          this.counterTarget.innerText = parseInt(this.counterTarget.innerText.match(/\d/)[0], 10) + 1 + " reviews "
          firstPost.innerHTML = ""
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
