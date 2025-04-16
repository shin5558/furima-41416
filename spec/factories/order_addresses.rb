FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { 2 } # 1以外を指定（1は「---」の選択肢）
    city          { '渋谷区' }
    address       { '1-1-1' }
    building      { '渋谷ビル101' }
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' } # PAY.JP用のダミー
  end
end
