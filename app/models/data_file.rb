class DataFile < ActiveRecord::Base

  attr_accessible :title, :record_count, :fields_attributes
  belongs_to :dataset
  has_many :fields, :dependent => :destroy

  accepts_nested_attributes_for :fields, :reject_if =>  lambda { |attrs| attrs['column'].blank?}, :allow_destroy => true

  validates_presence_of :title

end
