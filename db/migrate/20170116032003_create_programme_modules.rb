class CreateProgrammeModules < ActiveRecord::Migration
  def change
    create_table :programme_modules do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
