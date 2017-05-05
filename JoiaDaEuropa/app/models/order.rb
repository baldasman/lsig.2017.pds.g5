class Order < ApplicationRecord
  belongs_to :user
  has_one :order_file
  has_one :order_status
end
