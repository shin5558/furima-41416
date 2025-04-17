class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]

  require 'payjp'

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_item # 支払い処理をメソッドに分ける
      @order_address.save
      redirect_to root_path

    else
      render :index, status: :unprocessable_entity

    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    return unless current_user == @item.user || @item.order.present?

    redirect_to root_path
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def redirect_if_invalid
    return unless current_user == @item.user || @item.order.present?

    redirect_to root_path
  end
  # 自分の商品または売却ずみならトップページへ遷移

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
