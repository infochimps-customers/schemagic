class DataFile < ActiveRecord::Base

  belongs_to :dataset, :dependent => :destroy
  has_many :fields

  accepts_nested_attributes_for :fields, :reject_if => lambda { |f| f[:content].blank? }, :allow_destroy => true

  validates_presence_of :title
#  validates_presence_of :schema

#  before_save :build_schema

  def build_schema
    schema_fields = [] << self.fields.each do |field|
            field.to_json
    end
    self.schema = schema_fields
  end

end
