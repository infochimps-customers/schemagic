class Dataset < ActiveRecord::Base

  require 'uuidtools'

  attr_accessible :data_files_attributes,:contact_name, :title, :company_name, :phone, :description, :email

  has_many :data_files, :dependent => :destroy
  accepts_nested_attributes_for :data_files, :reject_if => lambda { |attrs| attrs['title'].blank?}, :allow_destroy => true

  validates_presence_of :title
  validates_presence_of :uuid

  def generate_uuid!
    self.uuid = "%032x" % UUIDTools::UUID.timestamp_create.to_i
  end

end
