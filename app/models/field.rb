class Field < ActiveRecord::Base

  belongs_to :data_file

  requires_presence_of :name
  requires_presence_of :type

end
