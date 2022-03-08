import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";


export default class extends Controller {
  static targets = [ "results" ]

  static values = {
    urlrefresh: String,
  }

  excludeFood(event) {
    console.log("je veux exclude")
    console.log(event.currentTarget.dataset.foodId)
    const foodId = event.currentTarget.dataset.foodId
    const verb = "POST"
    fetch(`/foods/${foodId}/exclude`, {
      method: verb,
      headers: {
        "X-CSRF-Token": csrfToken()
      }
    }).then(response => this.refresh() )
  }


  refresh() {
    const url = '/illness_nutrients'

    const verb = "GET"
    fetch(url, {
      method: verb,
      headers: {
        "X-CSRF-Token": csrfToken(),
        "Content-Type": "application/text"
      }
    }).then(response => response.text())
      .then(text => document.getElementById('vitamins').innerHTML = text
      )
  }

  connect() {
    console.log(this.resultsTarget)
  }
}
