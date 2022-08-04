class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.belongs_to :order, foreign_key: true
      t.string :code
      t.boolean :active, default: true
      t.decimal :sale, precision: 5, scale: 2, null: false

      t.timestamps
    end
  end
end
