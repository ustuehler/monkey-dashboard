class AccountingController < ApplicationController
  def overview
    @entries = view_context.ledger.entries.sort_by(&:date)
    @first_date = @entries.first.date
    @last_date = @entries.last.date
  end

  def ledger
    @entries = view_context.ledger.entries.sort_by(&:date)
  end

  def balances
    if params[:account]
      @account = view_context.ledger.account(params[:account])
      @accounts = @account.children
    else
      @account = nil
      @accounts = view_context.ledger.accounts.select { |a| a.parent.nil? }
    end
    @accounts.sort!
  end

  def monthly_income
    @monthly_income = monthly_summary(view_context.ledger.income_accounts)
  end

  def monthly_expenses
    @monthly_expenses = monthly_summary(view_context.ledger.expense_accounts)
  end

  private

  # Returns an array of [month_date, amount, average, avgdiff].
  def monthly_summary(accounts)
    last_entry = accounts.map(&:entries).flatten.sort_by(&:date).last
    @last_month = Date.parse(last_entry.date.prev_month.strftime('%Y-%m-01'))
    @first_month = @last_month.prev_year.next_month

    total = Monkey::Accounting::Amount.zero
    last_average = nil

    accounts.map(&:entries).flatten.select { |e|
      e.date >= @first_month and e.date < @last_month.next_month
    }.group_by { |e|
      e.date.strftime('%Y-%m-01')
    }.sort_by(&:first).map { |month_date_string, entries|
      month_date = Date.parse(month_date_string)
      amount = entries.map { |e| e.amount_to(accounts) }.reduce(:+)

      total += amount
      average = total / (distance_in_months(@first_month, month_date) + 1)
      avgdiff = last_average.nil? ? 0 : (average - last_average)
      last_average = average

      [month_date, amount, average, avgdiff]
    }
  end

  def distance_in_months(from_date, to_date)
    (to_date.year * 12 + to_date.month) -
      (from_date.year * 12 + from_date.month)
  end
end
