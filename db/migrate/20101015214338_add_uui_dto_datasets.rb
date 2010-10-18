class AddUuiDtoDatasets < ActiveRecord::Migration
  def self.up
    add_column :datasets, :uuid, :string
    add_index :datasets, :uuid
  end

  def self.down
    remove_index :datasets, :uuid
    remove_column :datasets, :uuid
  end
end
