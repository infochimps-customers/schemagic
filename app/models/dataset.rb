class Dataset < ActiveRecord::Base

  has_many :data_files

  validates_presence_of :title
  validates_presence_of :email
  validates_presence_of :company_name

end
