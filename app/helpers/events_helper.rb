module EventsHelper
  def rsvp(event)
    if current_user.events.include?(event)
      link_to 'Cancel RSVP', cancel_event_rsvp_path(event)
    else
      link_to 'RSVP', rsvp_event_path(event), :confirm => "This will add the event to 'your events' within the account area"
    end
  end
end
