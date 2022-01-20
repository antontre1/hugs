import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['items', 'form'];
  static values = { position: String } // ce que l'on retourne ? à verif

  connect() {
    console.log("tout va bien");
    console.log(this.element);
    console.log(this.itemsTarget);
    console.log(this.formTarget);
  }
  send(event) {
  event.preventDefault();

  fetch(this.formTarget.action, {
    method: 'POST',
    headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
    body: new FormData(this.formTarget)
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data.inserted_item);
       if (data.inserted_item) {
        this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item);
      }
      this.formTarget.outerHTML = data.form;
  });

  }

}
