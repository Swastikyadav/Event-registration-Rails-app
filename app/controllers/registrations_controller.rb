class RegistrationsController < ApplicationController
  before_action :require_signin
  before_action :set_event

  def index
    @registrations = @event.registrations
  end


  def new
    @registration = @event.registrations.new
  end

  def create
    @registration = @event.registrations.new(registration_params)
    @registration.user = current_user
    if @registration.save
      redirect_to event_registration_path(@event, @registration)
    else
      render :new
    end
  end

  def show
    @registration = @event.registrations.find(params[:id])
  end

  private

    def registration_params
      params.require(:registration)
        .permit(:how_heard)
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

end
