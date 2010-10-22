class Dataset < ActiveRecord::Base

  require 'uuidtools'

  attr_accessible :data_files_attributes,:contact_name, :title, :company_name, :phone, :description, :email

  has_many :data_files
  accepts_nested_attributes_for :data_files, :reject_if => lambda { |attrs| attrs['title'].blank?}, :allow_destroy => true

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :uuid
  validates_presence_of :company_name
  validates_presence_of :email

  def generate_uuid!
    self.uuid = "%032x" % UUIDTools::UUID.timestamp_create.to_i
  end

  def schema
    {
      :title        => title,
      :description  => description,
      :uuid         => uuid,
      :company_name => company_name,
      :contact_name => contact_name,
      :email        => email,
      :phone        => phone,
      :dataset      => data_files.map do |data_file|
        {
          :name         => data_file.title,
          :record_count => data_file.record_count,
          :type         => 'record',
          :fields       => data_file.fields.by_column.map do |field|
            {
              :name  => field.name,
              :doc   => field.doc,
              :type  => field.data_type,
            }
          end
        }
      end
    }
  end

end
