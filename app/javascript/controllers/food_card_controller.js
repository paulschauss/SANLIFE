import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "card" ]
  static values = {
    id: Number
  }

  refresh() {

    const new_card = `foods/${this.idValue}/refresh`
    fetch(new_card, { headers: { "Accept": "text/plain" } })
    .then(response => response.text())
    .then((data) => {
      this.cardTarget.outerHTML = data
    })
  }

  connect() {
  }
}
