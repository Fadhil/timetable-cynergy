class AddProgrammeSessionsRefToRegistrations < ActiveRecord::Migration
  def change
    add_reference :registrations, :programme_session, index: true, foreign_key: true
  end
end
