class CreateDatasets < ActiveRecord::Migration
  def self.up
    create_table :datasets do |t|
      t.string :company_name
      t.string :email
      t.string :contact_name
      t.string :phone
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :datasets
  end
end
