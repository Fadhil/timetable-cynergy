class AddTimetableToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :timetable, :string
  end
end
