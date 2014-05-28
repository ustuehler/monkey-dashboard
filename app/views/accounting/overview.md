<ol class="breadcrumb">
  <li class="active">Accounting</li>
</ol>

<blockquote>
  <p>Accounting, or accountancy, is the measurement, processing and communication of financial information about economic entities.</p>
  <footer><a href="https://en.wikipedia.org/wiki/Accounting"><cite title="Wikipedia - Accounting">Wikipedia</cite></a></footer>
</blockquote>

Your accounting ledger contains <%= @entries.size %> entries
for a period of <%= distance_of_time_in_words @first_date, @last_date %>
from <%= @first_date.strftime '%B %Y' %>
to <%= @last_date.strftime '%B %Y' %>.

Would you like to check your [account balances][1] or monthly [income][2] and [expenses][3] now?

[1]: /accounting/balance
[2]: /accounting/monthly-income
[3]: /accounting/monthly-expenses
