class DateExpiry < ActiveRecord::Base
  has_one :statistic, dependent: :destroy
end
