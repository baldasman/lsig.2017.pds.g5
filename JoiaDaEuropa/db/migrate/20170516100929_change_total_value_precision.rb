class ChangeTotalValuePrecision < ActiveRecord::Migration[5.0]

    def change
        remove_column :orders, :total_value
        add_column :orders, :total_value, :decimal, precision: 15, scale: 2
    end

end
