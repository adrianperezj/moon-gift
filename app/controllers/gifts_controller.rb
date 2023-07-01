class GiftsController < ApplicationController
  before_action :set_event, only: [:new, :create, :show, :edit]

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.event = @event
    if @gift.save
      redirect_to event_path(@event, code: @event.code), notice: 'Gift created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.event = @event
    if @gift.update(gift_params)
      redirect_to event_gift_path(@event, @gift), notice: 'Gift updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @event = Event.find(params[:event_id])
    if @event
      if params[:search].present?
        @gifts = @event.gifts.where("name ILIKE ?", "%#{params[:search]}%")
      else
        @gifts = @event.gifts
      end
    else
      redirect_to root_path, notice: 'Event not found'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
    redirect_to root_path, notice: 'Event not found' unless @event
  end

  def gift_params
    params.require(:gift).permit(:name, :description, :price, :photo)
  end
end
