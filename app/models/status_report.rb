class StatusReport < ActiveRecord::Base
  
  # Create relationships
  belongs_to :project
  
  # Add validations
  validates_presence_of :project_id, :summary, :overall, :reported_on
end
