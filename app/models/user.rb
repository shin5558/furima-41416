class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）のみ使用できます" }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）のみ使用できます" }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナのみ使用できます" }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナのみ使用できます" }
         validates :birthday, presence: true
         validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]+\z/, message: "は半角英数字混合で入力してください（英字と数字を両方含めてください）" }
  # presence: true は空白の時にはじかれる
  # (?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9_]文字、数字１個以上
end
