class EventsController < ApplicationController
  before_action :set_user, only: [:new]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = @user
    @event.event_code = generate_event_code

    if @event.save
      redirect_to event_path(@event), notice: 'Event created successfully!'
    else
      render :new
    end
  end

  private

  def set_user
    # Set the user instance variable here
    @user = User.find(params[:user_id])
  end

  def event_params
    params.require(:event).permit(:name, :date)
  end

  def generate_event_code
    SecureRandom.hex(4).upcase
  end
end
