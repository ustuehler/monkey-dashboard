<% if ledger.bank_accounts.map(&:balance).reduce(:+) != 0 %>
Let's have a look at your bank accounts. Are these all of them? If not, then please
<% else %>
There are no bank accounts configured or you have closed them all because their overall balance is zero.  Please
<% end %>
edit the key `accounting:bank_accounts` in `~/.monkey/config.yml` and list the names of all bank accounts that you track in your ledger.

<table class="table">
  <thead>
    <th>Account Name</th>
    <th class="text-right">Balance</th>
    <th class="text-right">Reconciled</th>
  </thead>
  <tbody>
    <% ledger.bank_accounts.sort.each do |a| %>
    <tr>
      <td><%= a.name %></td>
      <td class="text-right"><%= a.balance < 0 ? warning(a.balance) : success(a.balance) %></td>
      <td class="text-right"><%= danger 'never' %></td>
    </tr>
    <% end %>
  </tbody>
</table>
