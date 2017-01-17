class AddCategoryRefsToProgrammeModules < ActiveRecord::Migration
  def change
    add_reference :programme_modules, :category, index: true, foreign_key: true
  end
end
