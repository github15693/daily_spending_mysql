class User < ActiveRecord::Base
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :friend_lists, dependent: :destroy
  has_many :group_chats
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.extra.raw_info.name
      user.username = auth.extra.raw_info.nickname
      # user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
