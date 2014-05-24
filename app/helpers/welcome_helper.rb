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
end
