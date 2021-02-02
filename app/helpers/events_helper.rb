module EventsHelper
  def attendees_exists?
    @event.attendees.exists?
  end
end
