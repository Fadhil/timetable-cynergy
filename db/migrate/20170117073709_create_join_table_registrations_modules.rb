class CreateJoinTableRegistrationsModules < ActiveRecord::Migration
  def change
    create_join_table :registrations, :programme_modules do |t|
      # t.index [:registration_id, :programme_module_id]
      # t.index [:programme_module_id, :registration_id]
    end
  end
end
