module EventsHelper
  def rsvp(event)
    if current_user.flagged?(event, :rsvp)
      link_to 'Cancel RSVP', cancel_event_rsvp_path(event)
    else
      link_to 'RSVP', rsvp_event_path(event), :confirm => 'We will send a notification email near to the event'
    end
  end
end
