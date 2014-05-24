module WelcomeHelper
  # Bootstrap CSS contextual colors
  [:muted, :primary, :success, :info, :warning, :danger].each do |level|
    define_method(level) do |text|
      content_tag :span, text, :class => "text-#{level}"
    end
  end

  def last_transaction
    @last_transaction ||= ledger.entries.sort { |a,b| a.date <=> b.date }.last
  end

  def last_transaction_age
    1.day * (Date.today - last_transaction.date)
  end

  def equity
    ledger.equity_accounts.map(&:balance).reduce(:+)
  end

  def assets
    ledger.asset_accounts.map(&:balance).reduce(:+)
  end

  def liabilities
    ledger.liability_accounts.map(&:balance).reduce(:+)
  end

  def income
    ledger.income_accounts.map(&:balance).reduce(:+)
  end

  def expenses
    ledger.expense_accounts.map(&:balance).reduce(:+)
  end

  def net_income
    # Income is negative in the accounting ledger, so the "accounting equation"
    # has to be reversed.
    income + expenses
  end

  def contributed_capital
    equity
  end

  def retained_earnings
    # Income is negative in the accounting ledger, so the "accounting equation"
    # has to be reversed.
    net_income + dividends
  end

  def dividends
    Monkey::Accounting::Amount.zero
  end

  def owners_equity
    contributed_capital + retained_earnings
  end
end
