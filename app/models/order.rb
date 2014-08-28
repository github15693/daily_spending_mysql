class Order < ActiveRecord::Base
  has_many :order_details, dependent: :destroy
  has_many :goods, through: :order_details

  has_many :order_statistics, dependent: :destroy
end
