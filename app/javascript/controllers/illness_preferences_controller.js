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
      this.buttonTarget.classList.remove('btn-secondary')
      this.buttonTarget.classList.add('btn-primary')
    } else {
      this.buttonTarget.classList.add('btn-secondary')
      this.buttonTarget.classList.remove('btn-primary')
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
      const event = new CustomEvent("refreshResult")
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
