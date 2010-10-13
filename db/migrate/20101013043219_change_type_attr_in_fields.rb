class ChangeTypeAttrInFields < ActiveRecord::Migration
  def self.up
    remove_column :fields, :type
    add_column :fields, :data_type, :string
  end

  def self.down
    add_column :fields, :type, :string
    remove_column :fields, :data_type
  end
end
