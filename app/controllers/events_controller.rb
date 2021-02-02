class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    user = User.first
    @event = user.events.build(event_params)

    redirect_to @event if @event.save
  end

  private

  def event_params
    params.require(:event).permit(:date, :description)
  end
end
