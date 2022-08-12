import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    var objDiv = document.getElementById("top-banner");
    if (window.scrollY >= objDiv.scrollHeight) {
      this.element.classList.add("navbar-lewagon-white")
    } else {
      this.element.classList.remove("navbar-lewagon-white")
    }
  };
}
