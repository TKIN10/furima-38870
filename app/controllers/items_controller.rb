class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index]

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :amount_of_money, :category_id, :condition_id, :delivery_charge_id, :area_id, :number_of_day_id).merge(user_id: current_user.id)
  end
end