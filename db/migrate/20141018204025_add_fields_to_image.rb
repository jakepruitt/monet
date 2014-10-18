class AddFieldsToImage < ActiveRecord::Migration
  def change
    add_column :images, :title, :string
    add_column :images, :description, :string
    add_column :images, :location, :string
    add_column :images, :date_taken, :datetime
  end
end
