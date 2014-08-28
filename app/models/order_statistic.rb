class OrderStatistic < ActiveRecord::Base
  belongs_to :order
  belongs_to :statistic
end
