Here's a list of all the accounts in your ledger and their current balance.

<table class="table">
  <thead>
    <th>Account Name</th>
    <th class="text-right">Balance</th>
  </thead>
  <tbody>
    <% ledger.accounts.sort.each do |a| %>
    <tr>
      <td><%= a.name %></td>
      <td class="text-right"><%= a.balance %></td>
    </tr>
    <% end %>
  </tbody>
</table>
