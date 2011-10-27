class Project < ActiveRecord::Base
  belongs_to :tracker
  
  validates_presence_of :project_id

end
