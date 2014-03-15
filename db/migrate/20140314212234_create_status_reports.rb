class CreateStatusReports < ActiveRecord::Migration
  def change
    create_table :status_reports do |t|
      t.text :summary
      t.string :overall
      t.string :scope
      t.string :schedule
      t.string :resources
      t.date :reported_on
      t.references :project, index: true

      t.timestamps
    end
  end
end
