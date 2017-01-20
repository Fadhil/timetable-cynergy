class RemoveFacultyFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :faculty, :string
  end
end
