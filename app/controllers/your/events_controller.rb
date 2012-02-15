class Your::EventsController < ApplicationController
  before_filter :require_login
  before_filter :orientation

  def index
    @events = []
    for event in Event.all
      if event.flagged_by?(current_user, :rsvp)
        @events << event
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def cancel_rsvp
    @event = Event.find(params[:id])
    current_user.unflag(@event, :rsvp)
    redirect_to your_events_path, :notice => "You have successfully cancelled your RSVP for '#{@event.title.downcase}'"
  end
end
