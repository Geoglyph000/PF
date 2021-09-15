class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  validates :user_name, presence: true

  #退会済みユーザかどうかを判別、退会済みならfalseを返す
  def active_for_authentication?
    super && (self.is_active == true)
  end

end
