class GiftsController < ApplicationController
  before_action :set_event, only: [:new, :create, :show, :edit, :update, :destroy]

# Adrian quitamos el index de gifts porque no lo necesitamos, ya que los gifts se muestran en el show de events.

  def new
    @gift = Gift.new
    authorize @gift
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.event = @event
    authorize @gift
    if @gift.save
      redirect_to event_path(@event, code: @event.code), notice: 'Gift created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @gift = Gift.find(params[:id])
    authorize @gift
  end

  def edit
    @gift = Gift.find(params[:id])
    authorize @gift
  end

  def update
    @gift = Gift.find(params[:id])
    authorize @gift
    if @gift.update!(gift_params)
      redirect_to event_gift_path(@event, @gift), notice: 'Gift updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gift = Gift.find(params[:id])
    authorize @gift
    if @gift.purchase.present?
      redirect_to event_path(@event, code: @event.code), notice: 'Gift cannot be deleted because it has a purchase!'
    else
      @gift.destroy
      redirect_to event_path(@event, code: @event.code), notice: 'Gift deleted successfully!'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def gift_params
    params.require(:gift).permit(:name, :description, :price, :photo)
  end
end
