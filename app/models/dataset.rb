class Dataset < ActiveRecord::Base

  attr_accessible :data_files_attributes,:contact_name, :title, :company_name, :phone, :description, :email

  has_many :data_files, :dependent => :destroy
  accepts_nested_attributes_for :data_files, :reject_if => lambda { |attrs| attrs['title'].blank?}, :allow_destroy => true

  validates_presence_of :title

end
