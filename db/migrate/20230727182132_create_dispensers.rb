class CreateDispensers < ActiveRecord::Migration[7.0]
  def change
    create_table :dispensers do |t|
      t.float :flow_volume, null: false
      t.decimal :price_per_liter, precision: 8, scale: 2, default: 0.0
      t.integer :tap_open_count, default: 0

      t.timestamps
    end
  end
end
