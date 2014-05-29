<ol class="breadcrumb">
  <li class="active">Accounting</li>
</ol>

<blockquote class="well">
  <p>Accounting, or accountancy, is the measurement, processing and communication of financial information about economic entities.</p>
  <footer><a href="https://en.wikipedia.org/wiki/Accounting"><cite title="Wikipedia - Accounting">Wikipedia</cite></a></footer>
</blockquote>

Most of the times when you come here you probably want to [add entries][new] to
your accounting ledger.  Would you rather check your [account balances][balances]
or monthly [income][income] and [expenses][expenses] instead?

By the way, your accounting ledger currently contains [<%= @entries.size %>
entries][entries] for a period of <%= info distance_of_time_in_words(@first_date,
@last_date) %> from <%= info @first_date.strftime('%B %Y') %> to <%=
info @last_date.strftime('%B %Y') %>.

[entries]: /accounting/entries
[new]: /accounting/entries/new
[balances]: /accounting/balances
[income]: /accounting/monthly-income
[expenses]: /accounting/monthly-expenses
