class Field < ActiveRecord::Base

  belongs_to :data_file, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :type

end
