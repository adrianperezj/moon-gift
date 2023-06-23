class GiftsController < ApplicationController
  before_action :set_event, only: [:index, :new, :create]

# Adrian quitamos el index de gifts porque no lo necesitamos, ya que los gifts se muestran en el show de events.

  def new
    @gift = Gift.new
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
