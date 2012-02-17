class Your::EventsController < ApplicationController
  before_filter :require_login
  before_filter :orientation

  def index
    @events = current_user.events
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
