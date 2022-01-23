import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['items', 'form'];
  static values = { position: String } // ce que l'on retourne ? à verif

  send(event) {
  event.preventDefault();
  console.log(this.formTarget.action);
  fetch(this.formTarget.action, {
    method: 'POST',
    headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
    body: new FormData(this.formTarget)
  })
    .then(response => response.json())
    .then((data) => {
       if (data.inserted_item) {
        this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item);
      }
      this.formTarget.outerHTML = data.form;
  });

  }

}
