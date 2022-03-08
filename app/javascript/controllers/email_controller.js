import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = [ 'button', 'loader', 'success' ]

  showLoader() {
    this.buttonTarget.classList.add('d-none')
    this.loaderTarget.classList.remove('d-none')
    this.successTarget.classList.add('d-none')
  }

  showSuccess() {
    this.buttonTarget.classList.add('d-none')
    this.loaderTarget.classList.add('d-none')
    this.successTarget.classList.remove('d-none')
  }

  send() {
    this.showLoader()
    fetch('/send_email', { method: 'POST' , headers: {
      "X-CSRF-Token": csrfToken()
    }})
    .then(response => this.showSuccess())
  }

  connect() {
    console.log("coucou")
  }
}
