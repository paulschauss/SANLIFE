import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "card" ]
  static values = {
    id: Number,
    nutrientId: Number
  }

  refresh() {

    const new_card = `foods/next?nutrient_id=${this.nutrientIdValue}`
    fetch(new_card, { headers: { "Accept": "text/plain" } })
    .then(response => response.text())
    .then((data) => {
      this.cardTarget.outerHTML = data
    })
  }
}
