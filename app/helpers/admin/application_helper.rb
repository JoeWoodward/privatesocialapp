module Admin::ApplicationHelper
  #format a date helper
  def format_date(date)
    I18n.l date
  end
end
