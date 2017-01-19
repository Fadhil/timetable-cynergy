class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :salutation
      t.string :full_name
      t.string :staff_id
      t.string :designation
      t.string :faculty
      t.string :office_telephone_number
      t.string :mobile_telephone_number_
      t.string :employment_type
      t.string :qualification
      t.string :field_of_knowledge
      t.string :technical_skills_string
      t.string :personal_skills

      t.timestamps null: false
    end
  end
end
