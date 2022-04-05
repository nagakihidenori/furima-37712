class ItemsController < ApplicationController

  before_action :move_to_signed_in, except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
  make_active_hash
  @item = Item.new
  end

  def create
  make_active_hash
  @item = Item.new(item_params)

    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      else
      redirect_to root_path
    end
  end

  def update
    make_active_hash
    @item = Item.find(params[:id])
    @item.update(item_params)

    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end

  end

  private

  def item_params
    params.require(:item).permit(:commo_name, :commo_ex, :commo_cate_id, :commo_st_id, :commo_deli_charge_id, :prefecture_id, :commo_deli_day_id, :commo_price, :image).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end

  def make_active_hash
    @prefecture = Prefecture.all
    @commo_deli_day = CommoDeliDay.all
    @commo_st = CommoSt.all
    @commo_cate = CommoCate.all
    @commo_deli_charge = CommoDeliCharge.all
    
  end


end
