<ol class="breadcrumb">
  <li><%= link_to 'Accounting', '/accounting' %></li>
  <li class="active">Monthly Expenses</li>
</ol>

Showing monthly expenses from <%= @first_month.strftime '%B %Y' %> to <%= @last_month.strftime '%B %Y' %>.

<table class="table">
  <thead>
    <tr>
      <th>Month</th>
      <th class="text-right">Amount</th>
      <th class="text-right">Average</th>
    </tr>
  </thead>
  <tbody>
    <% @monthly_expenses.reverse.each do |month_date, amount, average, avgdiff| %>
    <tr>
      <td><%= month_date.strftime '%B %Y' %></td>
      <td class="text-right"><%= amount %></td>
      <td class="text-right"><%= avgdiff == 0 ? info(average) : (avgdiff > 0 ? warning(average) : success(average)) %></td>
    </tr>
    <% end %>
  </tbody>
</table>
