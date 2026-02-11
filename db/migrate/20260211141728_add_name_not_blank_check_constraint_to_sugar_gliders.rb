class AddNameNotBlankCheckConstraintToSugarGliders < ActiveRecord::Migration[7.2]
  def change
    add_check_constraint :sugar_gliders, "name <> ''", name: "sugar_gliders_name_not_blank"
  end
end
