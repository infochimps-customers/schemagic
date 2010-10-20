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
    schema = { }
    schema[:title] = self.title
    schema[:descripton] = self.description
    schema[:dataset] = []
    self.data_files.each do |df|
      schema[:dataset] << df.build_record
    end
    schema
  end

end
