class Statistic < ActiveRecord::Base
  has_many :order_statistics, dependent: :destroy
  has_many :orders, through: :order_statistics
  has_one :date_expiry, dependent: :destroy
end
