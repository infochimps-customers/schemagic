class AddIndextoFields < ActiveRecord::Migration
  def self.up
    add_column :fields, :index, :boolean
  end

  def self.down
    remove_column :fields, :boolean
  end
end
