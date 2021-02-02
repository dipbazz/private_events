class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @past_events = Event.previous_events
    @upcoming_events = Event.upcoming_events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    redirect_to @event if @event.save
  end

  private

  def event_params
    params.require(:event).permit(:date, :description)
  end
end
