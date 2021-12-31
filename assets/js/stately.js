function toggleMainNav() {
  const nav = document.querySelector('.js-site-nav-list');
  const navItems = document.querySelector('.js-site-nav-item');
  const navTrigger = document.querySelector('.js-site-nav-trigger');

  if (navTrigger != null) {
    navTrigger.addEventListener('click', function(event){
      event.preventDefault();
      toggleClasses(nav, 'open');
      this.classList.toggle('open')
    });
  }
}

function toggleSideNav() {
  const nav = document.querySelector('.js-side-nav');
  const navItems = document.querySelector('.js-side-nav-item');
  const activeLink = document.querySelector('.js-side-nav-link-active');

  if (activeLink != null) {
    activeLink.addEventListener('click', function(event){
      event.preventDefault();
      toggleClasses(nav, 'open');
    });
  }
}

function toggleClasses(el, className){
  if (el.classList) {
    el.classList.toggle(className);
  } else {
    const classes = el.className.split(' ');
    const existingIndex = classes.indexOf(className);

    if (existingIndex >= 0)
      classes.splice(existingIndex, 1);
    else
      classes.push(className);
    el.className = classes.join(' ');
  }
}

// Document ready
var ready = function(){
  // Handler when the DOM is fully loaded
  toggleMainNav();
  toggleSideNav();
};

if (
    document.readyState === "complete" ||
    (document.readyState !== "loading" && !document.documentElement.doScroll)
) {
  ready();
} else {
  document.addEventListener("DOMContentLoaded", ready);
}
