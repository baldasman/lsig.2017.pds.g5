class Order < ApplicationRecord
  belongs_to :user
  has_one :order_file
  belongs_to :order_status
end
