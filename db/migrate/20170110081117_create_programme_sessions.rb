class CreateProgrammeSessions < ActiveRecord::Migration
  def change
    create_table :programme_sessions do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :active, default: true
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
