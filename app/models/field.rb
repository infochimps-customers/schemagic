class Field < ActiveRecord::Base

  belongs_to :data_file

  validates_presence_of :name, :data_type
  named_scope :by_column, :order => "column ASC"

  TYPES=
    [["String","string"],["Integer","long"],["Decimal","double"],["Null","null"],["Bytes","bytes"]]

end
