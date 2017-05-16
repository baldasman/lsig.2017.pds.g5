class OrderStatus < ApplicationRecord
    has_many :orders

    def description

        I18n.translate(self.internal_description)

    end

end
