import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";


export default class extends Controller {
  static targets = [ "results" ]

  static values = {
    urlrefresh: String,
  }

  refresh() {
    console.log("je dois refresh le result")

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
