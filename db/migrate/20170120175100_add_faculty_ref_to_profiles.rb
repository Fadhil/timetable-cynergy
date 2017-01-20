class AddFacultyRefToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :faculty, index: true, foreign_key: true
  end
end
