$(document).ready(function() {
  $('td.actions a.glyphicon-edit').click(function(e) {
    e.stopPropagation();
    alert('edit: entry-id=' + $(this).parent().parent().attr('entry-id'));
  });

  $('td.actions a.glyphicon-remove').click(function(e) {
    e.stopPropagation();
    alert('remove: entry-id=' + $(this).parent().parent().attr('entry-id'));
  });

  $('tr.ledger-entry').click(function(e) {
    if (e.target.nodeName != 'A') {
      $(this).toggleClass('success');
      $('tr.ledger-transaction[entry-id=' + $(this).attr('entry-id') + ']').
        toggleClass('warning').
        toggle();
    }
  });
});
