import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";


export default class extends Controller {
  static targets = [ "button" ]
  static values = {
    active: Boolean,
    urladd: String,
    urlremove: String
  }

  updateColor() {
    if (this.activeValue) {
      this.buttonTarget.classList.remove('btn-inactive')
      this.buttonTarget.classList.add('btn-active')
    } else {
      this.buttonTarget.classList.add('btn-inactive')
      this.buttonTarget.classList.remove('btn-active')
    }
  }

  syncServer() {
    const url = this.activeValue ? this.urladdValue : this.urlremoveValue
    const verb = this.activeValue ? 'POST' : 'DELETE'
    fetch(url, {
      method: verb,
      headers: {
        "X-CSRF-Token": csrfToken()
      }
    }).then(x => {
      // refreshResults
      console.log('je suis bine la')
      const event = new CustomEvent("refreshResult")
      console.log(event)
      window.dispatchEvent(event)

    })
  }

  connect() {
    this.updateColor()
  }

  toggle(event) {
    this.activeValue = !this.activeValue
    this.updateColor()
    this.syncServer()
  }
}
