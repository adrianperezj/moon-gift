class EventsController < ApplicationController
  # before_action :set_user, only: %i[create]

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.code = generate_event_code
    authorize @event
    if @event.save
      redirect_to event_path(@event, code: @event.code), notice: 'Event created successfully!'
    else
      render :new
    end
  end

  def show
    @event = Event.find_by(code: params[:code])
    authorize @event
    if @event.nil?
      redirect_to root_path, notice: 'Event not found'
    else
      @gifts = @event.gifts
    end
  end

  def index
    @events = policy_scope(Event)
  end

  private

  def set_user
    # Set the user instance variable here
    @user = User.find(params[:user_id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :message, :code)
  end

  def generate_event_code
    SecureRandom.hex(4).upcase
  end
end
