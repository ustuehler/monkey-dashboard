Here's a list of all your customers.

<table class="table">
  <thead>
    <th>Customer</th>
    <th class="text-right">Invoiced</th>
    <th class="text-right">Receivable</th>
  </thead>
  <tbody>
    <% Monkey::Business::Customer.sort.each do |c| %>
    <tr>
      <td><%= c.name %></td>
      <td class="text-right"><%= c.invoices.map(&:amount).reduce(:+) %></td>
      <td class="text-right"><%= c.receivable_account.balance %></td>
    </tr>
    <% end %>
  </tbody>
</table>
