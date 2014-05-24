require 'redcarpet'

module MarkdownTemplateHandler
  def self.erb
    @erb ||= ActionView::Template.registered_template_handler :erb
  end

  def self.markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :tables => true,
      :fenced_code_blocks => true,
      :autolink => true
    )
  end

  def self.call(template)
    "#{self}.markdown.render(begin;#{erb.call(template)};end)"
  end
end

[:md, :markdown].each do |extension|
  ActionView::Template.register_template_handler extension, MarkdownTemplateHandler
end
