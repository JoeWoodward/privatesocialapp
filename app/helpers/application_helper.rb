module ApplicationHelper

  #format dates helper
  def format_date(date)
    I18n.l date
  end

  # Use within views to set the page's HTML title
  def title(title = nil)
    default = ""

    if title
      content_for(:title) { title }
    else
      content_for?(:title) ? content_for(:title) : default
    end
  end

  # Use within views to set the page's HTML meta description
  def description(text)
    content_for(:description) { text }
  end

  # Displays all flash messages in appropriately named divs for easy styling
  def flash_messages
    messages = flash.keys.collect { |key| flash_message(key, flash[key]) }
    content_tag(:div, messages.to_s.html_safe, :id => "flash-messages")
  end

  # Format a single flash message
  def flash_message(type, message)
    content_tag(:div, :class => "flash-message #{type.to_s}") do
      content_tag :p, message
    end
  end
end
