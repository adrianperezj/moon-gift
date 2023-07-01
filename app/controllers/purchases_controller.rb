class PurchasesController < ApplicationController
  # before_action :set_user, only: %i[new create]
  before_action :set_gift, only: %i[new create show]
  before_action :set_event, only: %i[new create show]

  def index
    @purchases = policy_scope(Purchase)
    # prices = @purchases.map do |purchase|
    # purchase.gift.price
    # end
  end

  def show
    @purchase = Purchase.find(params[:id])
    authorize @purchase
  end

  def new
    @purchase = Purchase.new
    authorize @purchase
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    @purchase.gift = @gift
    @purchase.total = @gift.price
    @purchase.save
    redirect_to event_gift_purchase_path(@event, @gift, @purchase)
    authorize @purchase
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchase_path, staus: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_gift
    @gift = Gift.find(params[:gift_id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def purchase_params
    params.require(:purchase).permit(:payment_method)
  end
end
