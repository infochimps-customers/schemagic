class Field < ActiveRecord::Base

  attr_accessible :name, :doc, :data_type

  belongs_to :data_file, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :type

end
