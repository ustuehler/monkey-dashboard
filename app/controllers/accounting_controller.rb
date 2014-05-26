class AccountingController < ApplicationController
  def monthly_expenses
    expense_accounts = view_context.ledger.expense_accounts
    last_entry = expense_accounts.map(&:entries).flatten.sort_by(&:date).last

    @last_month = Date.parse(last_entry.date.prev_month.strftime('%Y-%m-01'))
    @first_month = @last_month.prev_year.next_month

    total = Monkey::Accounting::Amount.zero
    months = 0

    @monthly_expenses = expense_accounts.map(&:entries).flatten.select { |e|
      e.date >= @first_month and e.date < @last_month.next_month
    }.group_by { |e|
      e.date.strftime('%Y-%m-01')
    }.sort_by(&:first).map { |month_date_string, entries|
      month_date = Date.parse(month_date_string)
      amount = entries.map { |e| e.amount_to(expense_accounts) }.reduce(:+)

      total += amount
      months += 1
      average = total / months

      [month_date, amount, average]
    }
  end
end
