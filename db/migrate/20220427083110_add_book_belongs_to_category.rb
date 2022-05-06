class AddBookBelongsToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :book, null: false, foreign_key: true
  end
end
