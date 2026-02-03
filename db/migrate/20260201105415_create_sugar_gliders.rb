class CreateSugarGliders < ActiveRecord::Migration[7.2]
  def change
    create_table :sugar_gliders do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.string :name, null: false
      t.integer :gender, null: false
      t.date :birthday, null: false
      t.decimal :weight, null: false, precision: 4, scale: 1

      t.timestamps
    end

  end
end
