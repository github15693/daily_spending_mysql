class User < ActiveRecord::Base
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :friend_lists, dependent: :destroy
  has_many :group_chats
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
