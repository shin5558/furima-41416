class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true

         validates :description, presence: true

         validates :category_id, presence: true

         validates :condition_id, presence: true

         validates :shipping_fee_id, presence: true

         validates :prefecture_id, presence: true

         validates :delivery_days_id, presence: true

         validates :price, presence: true

end
