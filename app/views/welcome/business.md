Here's a list of all your customers.

<table class="table">
  <thead>
    <th>Customer</th>
  </thead>
  <tbody>
    <% Monkey::Business::Customer.sort.each do |c| %>
    <tr>
      <td><%= c.name %></td>
    </tr>
    <% end %>
  </tbody>
</table>
