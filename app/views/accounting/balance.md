<ol class="breadcrumb">
  <li><%= link_to 'Accounting', '/accounting' %></li>
  <% if @account %>
  <li><%= link_to 'Balance', '/accounting/balance' %></li>
  <% @account.ancestors.reverse.each do |account| %>
  <li><%= link_to account.name, "/accounting/balance/#{account}" %></li>
  <% end %>
  <li class="active"><%= @account.name %></li>
  <% else %>
  <li class="active">Balance</li>
  <% end %>
</ol>

<table id="accounts" class="table">
  <thead>
    <th>Account Name</th>
    <th class="text-right">Balance</th>
  </thead>
  <tbody>
    <% balance = Monkey::Accounting::Amount.zero %>
    <% @accounts.each do |account| %>
    <tr>
      <td>
      <% if account.children.size == 0 %>
        <%= account.name %></td>
      <% else %>
        <%= link_to account.name, "/accounting/balance/#{account}" %>
      <% end %>
      </td>
      <td class="text-right"><%= balance += account.balance; account.balance %></td>
    </tr>
    <% end %>
    <tr>
      <td></td>
      <td class="text-right"><b><%= balance %></b></td>
    </tr>
  </tbody>
</table>
