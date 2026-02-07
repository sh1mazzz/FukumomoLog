class CreateDailyRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_records do |t|
      t.references :sugar_glider, null: false, foreign_key: true
      t.date :record_date, null: false
      t.decimal :cage_temperature, precision: 3, scale: 1, null: false
      t.integer :cage_humidity, null: false
      t.decimal :activity_hours, precision: 3, scale: 1, null: false
      t.integer :food_amount, null: false
      t.integer :snack_amount, null: false
      t.integer :water_amount, null: false
      t.integer :pee_amount, null: false
      t.integer :pee_color, null: false
      t.integer :poop_amount, null: false
      t.integer :poop_shape, null: false
      t.boolean :night_crying, null: false, default: false
      t.boolean :hair_loss, null: false, default: false
      t.boolean :ear_dryness, null: false, default: false
      t.boolean :self_injury, null: false, default: false
      t.text :memo

      t.timestamps
    end

    add_index :daily_records, [:sugar_glider_id, :record_date], unique: true

    add_check_constraint :daily_records, "cage_temperature BETWEEN -50 AND 50", name: "daily_records_cage_temperature_range"
    add_check_constraint :daily_records, "activity_hours BETWEEN 0 AND 24", name: "daily_records_activity_hours_range"
    add_check_constraint :daily_records, "mod(activity_hours * 2, 1) = 0", name: "daily_records_activity_hours_half_step"
  end
end
