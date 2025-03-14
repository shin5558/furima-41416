class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 6 }

  validates :email,
      format: { with: Devise.email_regexp },
      presence: true,
      uniqueness: { case_insensitive: true }
      # Example@domain.comでもオッケー

  validates :password, presence: true, length: { minimum: 6, maximum: 20 }, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "は英数字とアンダースコアのみ使用できます" }
  

end
