class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable  #モジュールを追加



  # findメソッドを追加
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.create(
        provider: auth.provider,
        uid:      auth.uid,
        username: auth.info.nickname,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end
 
    user
  end
 
  def feed
    Review.where("user_id = ?", id)
  end

  private
 
# ダミーのアドレスを用意
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end