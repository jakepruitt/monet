class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :fullname, :string
    add_attachment :users, :avatar
  end

  def self.down
    remove_column :users, :fullname, :string
    remove_attachment :users, :avatar
  end
end
