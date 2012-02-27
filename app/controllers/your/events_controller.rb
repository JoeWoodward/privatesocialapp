class Your::EventsController < Your::YourController
  def index
    @events = current_user.events.all(conditions: ["date >= ?", Date.today], order: :date)
  end

  def show
    @event = Event.find(params[:id])
  end

  def cancel_rsvp
    @event = Event.find(params[:id])
    current_user.events.delete(@event)
    redirect_to your_events_path, :notice => "You have cancelled your RSVP for '#{@event.title}'"
  end
end
