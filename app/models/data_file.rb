class DataFile < ActiveRecord::Base

  attr_accessible :title, :record_count, :fields_attributes
  belongs_to :dataset, :dependent => :destroy
  has_many :fields

  accepts_nested_attributes_for :fields, :reject_if =>  lambda { |attrs| attrs['name'].blank?}, :allow_destroy => true

  validates_presence_of :title

  def build_record
    avro_record = { }
    avro_record[:name] = self.title
    avro_record[:type] = "record"
    avro_record[:fields] = []
    self.fields.by_column.each do |field|
      attrs = field.attributes
      #'type' is a reserved type in ruby for STI, so we'll just switch it over here
      attrs["type"] = attrs["data_type"]
      avro_record[:fields] << attrs.to_json(:only => ["name", "type","doc"])
    end
    avro_record
  end

end
