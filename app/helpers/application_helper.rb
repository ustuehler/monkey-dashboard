module ApplicationHelper
  # Bootstrap CSS contextual colors
  [:muted, :primary, :success, :info, :warning, :danger].each do |level|
    define_method(level) do |text|
      content_tag :span, text, :class => "text-#{level}"
    end
  end

  def human_date(date = Date.today)
    date.strftime '%A, %B %-d'
  end
end
