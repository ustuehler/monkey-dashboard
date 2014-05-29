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
    var element = $(this);

    if (!$(event.target).is('a')) {
      element.toggleClass('success');
      $('tr.ledger-transaction[entry-id=' + element.attr('entry-id') + ']').
        toggleClass('warning').
        toggle();
    }
  });
});
