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
    if params[:code].present?
      @event = Event.find_by(code: params[:code])
    else
      @event = Event.find(params[:id])
    end
    authorize @event

    if @event.nil?
      redirect_to root_path, notice: 'Event not found'
    else
      if params[:search].present?
        @gifts = @event.gifts.where("name ILIKE ? OR code ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
      else
        @gifts = @event.gifts
      end
    end
  end

  def index
    @events = policy_scope(Event)
  end

  def my_events
    @events = current_user.events
  end

  private

  def set_user
    # Set the user instance variable here
    @user = User.find(params[:user_id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :image, :code)
  end

  def generate_event_code
    SecureRandom.hex(4).upcase
  end
end
