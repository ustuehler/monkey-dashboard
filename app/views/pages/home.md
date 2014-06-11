Today is <%= info human_date %> and the last recorded transaction in your ledger is
<% if last_transaction_age > 1.month %>
<%= danger time_ago_in_words(last_transaction.date) %> old.
It took place on <%= danger human_date(last_transaction.date) %>, so I'm pretty sure you didn't update your ledger in a loooong time.
<%= danger 'Update your ledger NOW or as soon as possible!' %>
<% elsif last_transaction_age > 2.weeks %>
<%= warning time_ago_in_words(last_transaction.date) %> old.
A couple of weeks may not make much of a difference to you if your overall financial situation is relatively stable, but it's a good habit to update your ledger frequently in order to keep an eye on your bank accounts.
<%= warning 'Update your ledger soon.' %>
<% elsif last_transaction_age > 1.week %>
<%= info time_ago_in_words(last_transaction.date) %> old.
One week may not make much of a difference if your overall financial status is relatively stable, but keep an eye on it.
<%= info 'Remember to update your ledger regularly.' %>
<% else %>
<%= success time_ago_in_words(last_transaction.date) %> old.
<%= success 'This means that you probably updated your ledger very recently, which is great!' %>
<% end %>

<% if last_transaction_age > 3.months %>
That's all from me. I'm not helping you any more until you update your ledger.

— Office Monkey
<% else %>
Your contributed capital is <%= contributed_capital %>.
Your assets are <%= assets %>.
Your liabilities are <%= liabilities %>.
Your total income is <%= income %>.
Your total expenses are <%= expenses %>.
Your net income is therefore <%= net_income < 0 ? success(net_income) : warning(net_income) %>.
Your owners equity is <%= owners_equity %>.
<% end %>
