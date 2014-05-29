$(document).ready(function() {
  $('table#ledger').on('click', 'a.glyphicon-edit', function(event) {
    event.stopPropagation();
    alert('edit: entry-id=' + $(this).closest('tr').attr('entry-id'));
  });

  $('table#ledger').on('click', 'a.glyphicon-remove', function(event) {
    event.stopPropagation();
    alert('remove: entry-id=' + $(this).closest('tr').attr('entry-id'));
  });

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
