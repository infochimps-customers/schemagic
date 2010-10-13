class AddDatasetsIDtoDataFiles < ActiveRecord::Migration
  def self.up
    add_column :data_files, :dataset_id, :integer
  end

  def self.down
    remove_column :data_files, :dataset_id
  end
end
