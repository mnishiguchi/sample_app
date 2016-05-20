/**
 * Allows the sidebar to close when a user clicked outside the sidebar,
 * or when the screen is resized.
 */
module.exports = function(){

  document.addEventListener("DOMContentLoaded", () => {

    const toggle   = document.querySelector('.sidebar-toggle');
    const sidebar  = document.querySelector('#sidebar');
    const checkbox = document.querySelector('#sidebar-checkbox');

    // Close the sidebar when the screen other than the sidebar itself is clicked.
    document.addEventListener('click', e => {
      const target = e.target;
      if (!checkbox.checked ||
         sidebar.contains(target) ||
         (target === checkbox || target === toggle)) return;
      checkbox.checked = false;
    }, false);

    // Close the sidebar on resize if it is open.
    window.addEventListener('resize', e => {
      if (!checkbox.checked) return;
      checkbox.checked = false;
    }, false);
  });
};
