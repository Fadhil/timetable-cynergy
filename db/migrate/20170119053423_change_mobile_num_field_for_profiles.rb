class ChangeMobileNumFieldForProfiles < ActiveRecord::Migration
  def up
    rename_column :profiles, :mobile_telephone_number_, :mobile_telephone_number
  end

  def down
    rename_column :profiles, :mobile_telephone_number, :mobile_telephone_number_
  end
end
