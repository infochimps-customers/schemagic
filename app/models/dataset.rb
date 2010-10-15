class Dataset < ActiveRecord::Base

  has_many :data_files, :dependent => :destroy
  accepts_nested_attributes_for :data_files, :reject_if => lambda { |a| a['title'].blank? }, :allow_destroy => true

  validates_presence_of :title
  validates_presence_of :email
  validates_presence_of :company_name

end
