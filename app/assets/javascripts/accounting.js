$(document).ready(function() {
  $('table#ledger').on('click', 'tr.ledger-entry', function(event) {
    var $this = $(this);
    if (!$(event.target).is('a')) {
      $this.toggleClass('success');
      $('tr.ledger-transaction[entry-id=' + $this.attr('entry-id') + ']').
        toggleClass('warning').
        toggle();
    }
  });
});
