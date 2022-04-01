class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user)
  end

  def new
    @prefecture = Prefecture.all
    @commo_deli_day = CommoDeliDay.all
    @commo_st = CommoSt.all
    @commo_cate = CommoCate.all
    @commo_deli_charge = CommoDeliCharge.all
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  
  end

  private

  def item_params
    params.require(:item).permit(:commo_name, :commo_ex, :commo_cate_id, :commo_st_id, :commo_deli_charge_id, :prefecture_id, :commo_deli_day_id, :commo_price, :image).merge(user_id: current_user.id)
  end



end
