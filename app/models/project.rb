class Project < ActiveRecord::Base

  # Add validations
  validates_presence_of :name, :manager, :organization
end
