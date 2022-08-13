import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    const navBar = document.getElementById("top-banner");
    const logoPic = document.getElementById("logo")
    if (window.scrollY >= navBar.scrollHeight) {
      this.element.classList.add("navbar-lewagon-white")
      logoPic.src = "/assets/logo-black.PNhttps://res.cloudinary.com/dcs2vqe2s/image/upload/v1660374731/logo-black_j2oilu.png"
    } else {
      this.element.classList.remove("navbar-lewagon-white")
      logoPic.src = "/assets/logo-whithttps://res.cloudinary.com/dcs2vqe2s/image/upload/v1660374725/logo-white_oudwnm.pnge.PNG"
    }
  };
}
