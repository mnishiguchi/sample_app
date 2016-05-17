$(document).ready(function() {
  (function(document) {
    var toggle   = document.querySelector('.sidebar-toggle');
    var sidebar  = document.querySelector('#sidebar');
    var checkbox = document.querySelector('#sidebar-checkbox');

    // Close the sidebar when the screen other than the sidebar itself is clicked.
    document.addEventListener('click', function(e) {
      var target = e.target;
      if(!checkbox.checked ||
         sidebar.contains(target) ||
         (target === checkbox || target === toggle)) return;
      checkbox.checked = false;
    }, false);

    // Close the sidebar on resize if it is open.
    window.addEventListener('resize', function(e) {
      console.log("resized");
      if(!checkbox.checked) return;
      checkbox.checked = false;
    }, false);
  })(document);
});
