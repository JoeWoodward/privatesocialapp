module Admin::ApplicationHelper
  #format a date helper
  def format_date(date)
    I18n.l date
  end

  def notice_count
    Notice.where(:activated => false).count
  end
end
