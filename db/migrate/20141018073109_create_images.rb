class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.timestamps
    end
    add_column :images, :user_id, :integer
    add_index :images, :user_id
    add_attachment :images, :image
  end

  def down
    drop_table :images
  end
end
