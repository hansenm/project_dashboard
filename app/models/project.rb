class Project < ActiveRecord::Base

  # Create relationships
  has_many :status_reports

  # Add validations
  validates_presence_of :name, :manager, :organization
end
