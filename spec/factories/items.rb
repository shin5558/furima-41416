FactoryBot.define do
  factory :item do
    association :user

    name              { 'テスト商品' }
    description       { 'これはテスト用の商品説明です。' }
    category_id       { 2 }
    condition_id      { 2 }
    shipping_fee_id   { 2 }
    prefecture_id     { 2 }
    delivery_day_id { 2 }
    price { 1000 }

    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_image.png'), 'image/png') }
  end
end
