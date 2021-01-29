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

    if @event.save
      redirect_to @event
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :description)
  end

end
