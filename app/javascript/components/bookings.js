import { csrfToken } from "@rails/ujs";

const watchAllBookingsElement = () => {
  let all_bookings = document.getElementById("list-booking");
  all_bookings.addEventListener('click', event => {
      if (event.target.className.includes('booking-element') && event.target.nodeName == "BUTTON") {
        event.preventDefault();
        const url = "/booking/ajax/".concat(event.target.id.slice(8));
        console.log(event.target.parentNode);
        fetch(url, {
            method: 'DELETE',
            headers: { 'X-CSRF-Token': csrfToken() },
            body: null
          })
          .then( () => {
            event.target.parentNode.outerHTML = "" ;
              });
        }
  });
}

export { watchAllBookingsElement };
