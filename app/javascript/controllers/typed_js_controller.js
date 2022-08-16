import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    if (this.element) {
      new Typed(this.element, {
        strings: ["Streamlining your legal experiences in Japan"],
        typeSpeed: 40,
        loop: false,
        showCursor: false,
      })
    }
  }
}
