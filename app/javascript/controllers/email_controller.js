import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ ]

  send() {
    fetch('/send_email', { method: 'POST' })
    // .then(response => response.text())
    // .then((data) => {
    //   this.cardTarget.outerHTML = data
    // })
  }

  connect() {
    console.log("coucou")
  }
}
