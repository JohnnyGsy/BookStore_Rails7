class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description
      t.references :category, foreing_key: true

      t.timestamps
    end
  end
end
