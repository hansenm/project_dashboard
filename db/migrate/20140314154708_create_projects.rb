class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :manager
      t.string :organization
      t.boolean :is_active
      t.boolean :is_promoted
      t.timestamps
    end
  end
end
