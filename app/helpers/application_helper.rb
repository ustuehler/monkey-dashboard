module ApplicationHelper
  def human_date(date = Date.today)
    format = if date.year == Date.today.year
               '%A, %B %-d'
             else
               '%A, %B %-d %Y'
             end
    date.strftime format
  end

  def ledger
    @ledger ||= Monkey::Accounting.default_ledger
  end
end
