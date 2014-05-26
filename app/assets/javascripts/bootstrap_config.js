$(document).ready(function() {
  $('button[data-toggle="offcanvas"]').click(function() {
    $('.row-offcanvas').toggleClass('active');
  });

  $('a.tree-toggle').click(function () {
    $(this).parent().children('ul.tree').slideToggle();
  });

  $('a.tree-toggle').removeAttr('href');
});
