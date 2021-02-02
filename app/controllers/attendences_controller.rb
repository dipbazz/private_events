class AttendencesController < ApplicationController
  def create
    @attendence = Attendence.new(attendee_id: session[:current_user_id], attended_event_id: params[:event])

    if @attendence.save
      redirect_to user_path(session[:current_user_id])
    else
      flash[:alert] = 'You have an error while joining this event.'
      redirect_to root_path
    end
  end
end
