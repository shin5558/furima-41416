# app/models/order_address.rb
class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token,
                :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  # purchase情報はOrder、住所はAddressテーブルに分かれて保存される想定です。

  # バリデーション（後で詳しく追加）

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁-4桁」の形式で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' } # ID:1 は「--」の想定
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10〜11桁の数字で入力してください' }
  end

  # 保存処理
  def save
    order = Order.create(user_id:, item_id:)
    Address.create(
      order_id: order.id,
      postal_code:,
      prefecture_id:,
      city:,
      address:,
      building:,
      phone_number:
    )
  end
end
