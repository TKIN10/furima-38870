class PurchaseInformationsController < ApplicationController
  before_action :set_item, only:[:index, :create]
  before_action :authenticate_user!, except: :index

  def index
    @purchase_information_shipping_address = PurchaseInformationShippingAddress.new
  end

  def create
    @purchase_information_shipping_address = PurchaseInformationShippingAddress.new(shipping_address_params)
    if  @purchase_information_shipping_address.valid?
      pay_item
      @purchase_information_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_address_params
    params.require(:purchase_information_shipping_address).permit(:area_id, :postal_code, :municipality, :adress, :bulding_name, :number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.amount_of_money,
      card: shipping_address_params[:token],
      currency: 'jpy'
    )
  end

end
