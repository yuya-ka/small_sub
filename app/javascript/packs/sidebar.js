(function () {
  'use strict'
  console.log('aaa')
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    new bootstrap.Tooltip(tooltipTriggerEl)
  })
})()

document.addEventListener('DOMContentLoaded', function() {
  const navLinks = document.querySelectorAll('.nav-link');

  navLinks.forEach(function(navLink) {
    navLink.addEventListener('mouseover', function() {
      navLink.classList.add('active');
    });

    navLink.addEventListener('mouseout', function() {
      navLink.classList.remove('active');
    });
  });
});