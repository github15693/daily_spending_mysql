class Role < ActiveRecord::Base
  has_many :user_roles, dependent: :destroy
  has_many :function_roles, dependent: :destroy
  has_many :functions, through: :function_roles
end
