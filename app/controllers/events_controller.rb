class EventsController < ApplicationController
  def rsvp
    @event = Event.find(params[:id])
    current_user.events << @event
    redirect_to events_path, :notice => "You can now view '#{@event.title}' event within your events"
  end

  def cancel_rsvp
    @event = Event.find(params[:id])
    current_user.events.delete(@event)
    redirect_to events_path, :notice => "You have cancelled your RSVP for '#{@event.title}'"
  end

  def index
    @events = Event.all
    @orientation = 'horizontal'
  end

  def show
    @event = Event.find(params[:id])
  end
end
