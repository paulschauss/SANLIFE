import { Controller } from "stimulus"

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
    fetch(url, { method: verb })
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
