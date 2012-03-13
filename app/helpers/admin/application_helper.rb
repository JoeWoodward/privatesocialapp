module Admin::ApplicationHelper
  #format a date helper
  def format_date(date)
    I18n.l date
  end

  def notice_count
    Notice.where(:activated => false).count
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:filter_html => true, :safe_links_only => true, :hard_wrap => true), autolink: true, no_intra_emphasis: true)
    markdown.render(text).html_safe
  end
end
