class StatusReport < ActiveRecord::Base
  belongs_to :project
  
  validates_presence_of :project_id, :summary, :overall
end
