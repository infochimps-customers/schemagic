class DataFile < ActiveRecord::Base

  belongs_to :dataset, :dependent => :destroy
  has_many :fields

  accepts_nested_attributes_for :fields, :reject_if => lambda { |f| f[:content].blank? }, :allow_destroy => true

  validates_presence_of :title
  validates_presence_of :schema

  def build_schema
  end

end
