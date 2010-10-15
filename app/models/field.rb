class Field < ActiveRecord::Base

  belongs_to :data_file, :dependent => :destroy

  validates_presence_of :name, :data_type
  named_scope :by_column, :order => "column ASC"

  TYPES=
    [["String","string"],["Integer","long"],["Decimal","double"]]

end
