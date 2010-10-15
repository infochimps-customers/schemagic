class AddDataFileIndexToFields < ActiveRecord::Migration
  def self.up
    add_index :fields, :data_file_id
  end

  def self.down
    remove_index :fields, :data_file_id
  end
end
