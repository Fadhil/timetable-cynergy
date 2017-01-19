class ChangeFieldForProfiles < ActiveRecord::Migration
  def up
    rename_column :profiles, :technical_skills_string, :technical_skills
  end

  def down
    rename_column :profiles, :technical_skills, :technical_skills_string
  end
end
