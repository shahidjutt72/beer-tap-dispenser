class CreateUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :usages do |t|
      t.references :dispenser, null: false, foreign_key: true
      t.datetime :tap_opened_at, null: false
      t.datetime :tap_closed_at
      t.integer :total_time, default: 0
      t.decimal :total_money_spent, precision: 8, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
