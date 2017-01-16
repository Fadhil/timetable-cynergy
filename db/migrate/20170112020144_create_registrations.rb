class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :weekly_teaching_hours
      t.string :required_venue
      t.text :required_stationery
      t.text :required_equipment
      t.text :additional_notes

      t.timestamps null: false
    end
  end
end
