class ChangeStringToTextForTimetable < ActiveRecord::Migration
  def up
    change_column :registrations, :timetable, :text
  end

  def down
    change_column :registrations, :timetable, :string
  end
end
