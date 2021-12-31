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

if (document.URL === "https://joinmatrix.org/servers/") {
  Array.from(document.getElementsByTagName("tr")).slice(1).forEach(r => {
    let c = r.children;
    let i = 2;
    while(i < 4) {
      switch (c[i].textContent) {
        case "No":
          c[i].classList.add("red");
          break;
        case "Yes":
        case "CoC and ToS":
          c[i].classList.add("green");
          break;
        default:
          c[i].classList.add("orange");
      }
      i++;
    }
    if (c[7].textContent == "Error!!")
      c[7].classList.add("red");
    else if (c[7].textContent.indexOf("Dendrite") == -1) {
      c[7].classList.add(parseFloat(c[7].textContent.substring(2)) >= 47.1 ? "green" : "orange");
    }
  })
}