class Field < ActiveRecord::Base


  belongs_to :data_file, :dependent => :destroy

  validates_presence_of :name

  TYPES=
    [["String","string"],["Integer","long"],["Decimal","double"]]

end
