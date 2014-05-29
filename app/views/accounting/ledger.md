<ol class="breadcrumb">
  <li><%= link_to 'Accounting', '/accounting' %></li>
  <li class="active">Ledger</li>
</ol>

<table id="ledger" class="table table-hover">
  <thead>
    <th>Date</th>
    <th>Description / Transactions</th>
    <th class="text-right">Amount</th>
    <th>Actions</th>
  </thead>
  <tbody>
    <% @entries.each do |entry| %>
    <tr class="ledger-entry" entry-id="<%= entry.id %>">
      <td><%= entry.date %></td>
      <td><%= entry.description %></td>
      <td class="text-right"><%= raw(entry.amount.to_s.gsub(' ', '&nbsp;')) %></td>
      <td class="actions">
        <a class="glyphicon glyphicon-edit text-warning"></a>
        <a class="glyphicon glyphicon-remove text-danger"></a>
      </td>
    </tr>
    <% entry.transactions.each do |txn| %>
    <tr class="ledger-transaction" entry-id="<%= entry.id %>">
      <td></td>
      <td><%= txn.account %></td>
      <td class="text-right"><%= raw((txn.amount || entry.null_amount).to_s.gsub(' ', '&nbsp;')) %></td>
      <td></td>
    </tr>
    <% end %>
    <% end %>
  </tbody>
</table>
