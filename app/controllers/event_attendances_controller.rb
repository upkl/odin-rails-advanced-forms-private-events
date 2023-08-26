# frozen_string_literal: true

class EventAttendancesController < ApplicationController
  def new
    @event = Event.find(params[:id])
    @event_attendance = current_user.event_attendances.new(attended_event: @event)

    if @event_attendance.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    current_user.event_attendances.destroy(current_user.event_attendances.where(attended_event: @event))

    redirect_to @event
  end
end
