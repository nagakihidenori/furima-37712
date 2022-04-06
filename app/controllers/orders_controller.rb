class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :no_purchased_item, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :municipality, :cities, :building, :tell_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_58663949025b31f455da30a8"
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).commo_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def no_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end


end
