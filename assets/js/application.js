var observer = new IntersectionObserver(function(entries) {
  var f64 = entries[0];
  if (f64.isIntersecting) {
    goBack.style.display = 'block';
  } else if (!f64.isIntersectind && f64.boundingClientRect.y > 1) {
    goBack.style.display = 'none';
  }
});

var goBack = document.querySelector('.top');
var target = document.querySelector('#f64');
observer.observe(target);

document.addEventListener('DOMContentLoaded', () => {
  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }

  setupVideos();
});

function setupVideos() {
  const videos = document.querySelectorAll('.play');
  videos.forEach(function(item) {
    item.addEventListener('click', showVideo);
  });
}

function showVideo(event) {
  event.preventDefault();

  const videoUrl = event.target.dataset.video;
  const modal = document.querySelector('.modal');
  const close = document.querySelector('.modal-close');
  const root = document.querySelector('html');
  const details = document.querySelector('.modal .details');

  const content = nextUntil(event.target, 'column')[0];

  close.addEventListener('click', hideVideo);
  modal.querySelector('iframe').setAttribute('src', videoUrl);

  details.innerHTML = content.innerHTML;

  root.classList.add('is-clipped');
  modal.classList.add('is-active');
}

function hideVideo(event) {
  event.preventDefault();

  const modal = document.querySelector('.modal');
  const root = document.querySelector('html');

  root.classList.remove('is-clipped');
  modal.classList.remove('is-active');
}

function nextUntil(elem, selector, filter) {
  // matches() polyfill
  if (!Element.prototype.matches) {
    Element.prototype.matches = Element.prototype.msMatchesSelector || Element.prototype.webkitMatchesSelector;
  }

  // Setup siblings array
  var siblings = [];

  // Get the next sibling element
  elem = elem.nextElementSibling;

  // As long as a sibling exists
  while (elem) {
    // If we've reached our match, bail
    if (elem.matches(selector)) break;
    // If filtering by a selector, check if the sibling matches
    if (filter && !elem.matches(filter)) {
      elem = elem.nextElementSibling;
      continue;
    }
    // Otherwise, push it to the siblings array
    siblings.push(elem);
    // Get the next sibling element
    elem = elem.nextElementSibling;
  }

  return siblings;
}
