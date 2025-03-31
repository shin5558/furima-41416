class Item < ApplicationRecord
  belongs_to :user
  belongs_to :shipping_fee
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  # 上記はユーザーモデルだけに使う

  validates :name, presence: true

  validates :description, presence: true

  validates :category_id, presence: true

  validates :condition_id, presence: true

  validates :shipping_fee_id, presence: true

  validates :prefecture_id, presence: true

  validates :delivery_days_id, presence: true

  validates :price, presence: true,
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9_999_999,
                      message: 'は¥300〜¥9,999,999の範囲で入力してください（半角数字のみ）'
                    }

  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }

  belongs_to :condition

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :condition_id, numericality: { other_than: 1 }

  belongs_to :shipping_fee

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :shipping_fee_id, numericality: { other_than: 1 }

  belongs_to :prefecture

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1 }

  belongs_to :delivery_day

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :delivery_days_id, numericality: { other_than: 1 }
end
