class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.timestamps
      t.integer :user_id
    end
    
    add_index :images, :user_id
    add_attachment :images, :image
  end

  def down
    drop_table :images
  end
end
