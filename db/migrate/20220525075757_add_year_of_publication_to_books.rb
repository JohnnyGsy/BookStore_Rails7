class AddYearOfPublicationToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :year_of_publication, :integer
  end
end
