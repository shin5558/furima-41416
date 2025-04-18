require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品できるとき' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@item).to be_valid
    end
  end

  context '出品できないとき' do
    it 'userが紐付いていなければ保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it '画像が空では保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では保存できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品説明が空では保存できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが未選択では保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態が未選択では保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end

    it '配送料の負担が未選択では保存できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee must be other than 1')
    end

    it '発送元の地域が未選択では保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it '発送までの日数が未選択では保存できない' do
      @item.delivery_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery days must be other than 1')
    end

    it '価格が空では保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300未満では保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の範囲で入力してください（半角数字のみ）')
    end

    it '価格が9999999を超えると保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の範囲で入力してください（半角数字のみ）')
    end

    it '価格が半角数字以外では保存できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の範囲で入力してください（半角数字のみ）')
    end
  end
end
