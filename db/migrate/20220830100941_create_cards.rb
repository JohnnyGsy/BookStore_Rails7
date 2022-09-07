class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :number
      t.string :name
      t.string :expiry_date
      t.integer :cvv
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
