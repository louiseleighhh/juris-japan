import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    const navBar = document.getElementById("top-banner");
    const logoPic = document.getElementById("logo")
    if (window.scrollY >= navBar.scrollHeight) {
      this.element.classList.add("navbar-lewagon-white")
      logoPic.src = "assets/logo-black.PNG"
    } else {
      this.element.classList.remove("navbar-lewagon-white")
      logoPic.src = "assets/logo-white.PNG"
    }
  };
}
