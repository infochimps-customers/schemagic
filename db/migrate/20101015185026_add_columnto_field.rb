class AddColumntoField < ActiveRecord::Migration
  def self.up
    add_column :fields, :column, :integer
  end

  def self.down
    add_column :fields, :column
  end
end
