const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  // we want to apply transparency only on the page#home
  // we identify the page#home thanks to one class added on the navabar on this page (class = "myhome")
  // and only for 1/5 of the screen size equivalent when we are scrolling down
  // navbar-lewagon-white class will be added beyond 1/5 if screen size
  if (!!(navbar) && navbar.classList.contains("myhome")) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight / 5) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
  $('.dropdown-toggle').dropdown()
}
export { initUpdateNavbarOnScroll };
