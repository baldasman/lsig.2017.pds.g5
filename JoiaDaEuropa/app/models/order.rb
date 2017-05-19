class Order < ApplicationRecord

    belongs_to :user
    belongs_to :order_file
    belongs_to :order_status

    validates :description, presence: true

end
