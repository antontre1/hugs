// csrfToken is needed to secure the request in AJAX with the Rails Server
import { csrfToken } from "@rails/ujs";

const watchAllBookingsElement = () => {
  // we target a specific part of the DOM, the node with all 'bookings' elements listed (as children nodes)
  let all_bookings = document.getElementById("list-booking");
  // add eventlistener on the click action on the node
  all_bookings.addEventListener('click', event => {
    // it is true if it's from the children having 'booking-element' class and if it is a "BUTTON" nodeName / tagName
    // event.target returns the node at the origin of the trigger (click)
      if (event.target.className.includes('booking-element') && event.target.nodeName == "BUTTON") {
        // we block any default action of the node (in case of formular very important)
        event.preventDefault();
        // prepare the URL for fetch
        const url = "/booking/ajax/".concat(event.target.id.slice(8));
        fetch(url, {
          method: 'DELETE',
          headers: { 'X-CSRF-Token': csrfToken() },
          body: null
        })
        .then( () => {
            // callback replacing the parentNode (eg: the entire booking line) by "", which is equivalent to delete it
            event.target.parentNode.outerHTML = "" ;
              });
        }
  });
}

// the function is exported, and will be called via import in the packs/application.js
export { watchAllBookingsElement };
