class PurchasesController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_gift, only: %i[new create]

  def index
    @purchases = Purchase.where(user: current_user).group(:event)
    # prices = @purchases.map do |purchase|
    # purchase.gift.price
    # end
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = @user
    @purchase.save
    redirect_to purchase_path(@purchase)
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
    @gift = Gift.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:total, :payment_method)
  end
end
