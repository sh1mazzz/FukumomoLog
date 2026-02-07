class AddDefaultsToDailyRecordsEnums < ActiveRecord::Migration[7.2]
  def change
    change_column_default :daily_records, :food_amount, 0
    change_column_default :daily_records, :snack_amount, 0
    change_column_default :daily_records, :water_amount, 0
    change_column_default :daily_records, :pee_amount, 0
    change_column_default :daily_records, :poop_amount, 0
    change_column_default :daily_records, :pee_color, 0
    change_column_default :daily_records, :poop_shape, 0
  end
end
