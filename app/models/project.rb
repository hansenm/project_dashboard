class Project < ActiveRecord::Base

  # Create relationships
  has_many :status_reports
  has_one :current_status_report, class_name: 'StatusReport', foreign_key: :project_id, order: 'reported_on DESC'
  
  delegate :overall, to: :current_status_report, allow_nil: true
  delegate :reported_on, to: :current_status_report, allow_nil: true
  

  # Add validations
  validates_presence_of :name, :manager, :organization
end
