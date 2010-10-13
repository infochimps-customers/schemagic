class DataFile < ActiveRecord::Base

  belongs_to :dataset
  has_many :fields

  validates_presence_of :title
  validates_presence_of :schema

  def build_schema
  end

end
