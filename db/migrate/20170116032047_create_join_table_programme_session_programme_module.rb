class CreateJoinTableProgrammeSessionProgrammeModule < ActiveRecord::Migration
  def change
    create_join_table :programme_sessions, :programme_modules do |t|
      # t.index [:programme_session_id, :programme_module_id]
      # t.index [:programme_module_id, :programme_session_id]
    end
    add_index :programme_modules_sessions, [:programme_session_id, :programme_module_id], name: 'session_module_id'
    add_index :programme_modules_sessions, [:programme_module_id,:programme_session_id], name: 'module_session_id'
  end
end
