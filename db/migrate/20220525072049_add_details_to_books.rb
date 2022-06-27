class AddDetailsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :price, :decimal, precision: 5, scale: 2
    add_column :books, :materials, :string
    add_column :books, :quantity, :integer
    add_column :books, :height, :decimal, precision: 5, scale: 1
    add_column :books, :width, :decimal, precision: 5, scale: 1
    add_column :books, :depth, :decimal, precision: 5, scale: 1
  end
end
