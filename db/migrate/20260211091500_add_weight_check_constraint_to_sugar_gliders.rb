class AddWeightCheckConstraintToSugarGliders < ActiveRecord::Migration[7.2]
  def change
    add_check_constraint :sugar_gliders, "weight BETWEEN 0 AND 999.9", name: "sugar_gliders_weight_range"
  end
end
