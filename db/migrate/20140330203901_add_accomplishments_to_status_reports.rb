class AddAccomplishmentsToStatusReports < ActiveRecord::Migration
  def change
    change_table :status_reports do |t|
      t.text :accomplishments
    end    
  end
end
