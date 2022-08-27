import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    const navBar = document.getElementById("top-banner");
    const logoPic = document.getElementById("logo");
    const dropDown = document.getElementById("dropdown")
    if (window.scrollY >= 50) {
      this.element.classList.add("navbar-lewagon-blue")
      dropDown.classList.add("dropdown-menu-blue")
    } else {
      this.element.classList.remove("navbar-lewagon-blue")
      dropDown.classList.remove("dropdown-menu-blue")
    }

    logoPic.addEventListener('mouseover', function() {
      logoPic.src = "https://res.cloudinary.com/drmu7et5q/image/upload/v1660754028/logo-gold_wbf0ef.png"
    });

    logoPic.addEventListener('mouseout', function(){
      logoPic.src = "https://res.cloudinary.com/drmu7et5q/image/upload/v1660748365/logo-white_ofvlr8.png";
    });
  };
}
