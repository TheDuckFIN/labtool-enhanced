class Checklist < ActiveRecord::Base

  has_many :checklist_options
  belongs_to :week

end
