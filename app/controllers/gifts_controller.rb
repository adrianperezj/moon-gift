class GiftsController < ApplicationController
  before_action :set_event, only: [:index, :new, :create]

  def index
    @gifts = Gift.all
  end

  def new
    @gift = Gift.new(gift_params)
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.event = @event
    if @gift.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def gift_params
    params.require(:gift).permit(:name, :description, :price)
  end
end
