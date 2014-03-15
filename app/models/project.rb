class Project < ActiveRecord::Base

  # Create relationships
  has_many :status_reports
  has_one :current_status_report, class_name: 'StatusReport', foreign_key: :project_id, order: 'reported_on DESC'
  

  # Add validations
  validates_presence_of :name, :manager, :organization
end
