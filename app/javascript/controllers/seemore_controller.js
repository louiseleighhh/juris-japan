import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 'content' ]

  connect() {
    console.log('Hello from seemore_controller.js')
    // console.log(this.testTarget)
  }

  display(event) {
    const seemoreContent = this.contentTarget
    const button = event.currentTarget

      button.classList.toggle('seemore__button--active');

      if (button.classList.contains('seemore__button--active')) {
        seemoreContent.style.maxHeight = "fit-content";
      } else {
        seemoreContent.style.maxHeight = 0;
      }
  }
}
