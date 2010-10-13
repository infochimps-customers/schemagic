class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.string :name
      t.text :doc
      t.string :type
      t.integer :data_file_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
