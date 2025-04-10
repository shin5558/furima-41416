class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_root, only: [:edit, :update, :destroy]

  def move_to_root
    redirect_to root_path if current_user != @item.user
  end

  def set_item
    @item = Item.find(params[:id])
  end  

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      Rails.logger.debug @item.errors.full_messages
      render :new
    end
  end

  def show

  end

  # 編集画面表示
  def edit

  end

  # 更新処理
  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '更新が完了しました'
    else
      render :edit
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    if current_user == @item.user
      @item.destroy
      redirect_to root_path, notice: '商品を削除しました'
    else
      redirect_to root_path, alert: '権限がありません'
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
  # permit以下のところがストロングパラメータ
end
