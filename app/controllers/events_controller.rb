class EventsController < ApplicationController
  before_filter :require_login
  before_filter :orientation

  def rsvp
    @event = Event.find(params[:id])
    current_user.flag(@event, :rsvp)
    redirect_to events_path, :notice => "You can now view '#{@event.title.downcase}' within "#{link_to 'your events', your_events_path}
  end

  def cancel_rsvp
    @event = Event.find(params[:id])
    current_user.unflag(@event, :rsvp)
    redirect_to events_path, :notice => "You have successfully cancelled your RSVP for '#{@event.title.downcase}'"
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
