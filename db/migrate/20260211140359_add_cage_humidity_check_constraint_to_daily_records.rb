class AddCageHumidityCheckConstraintToDailyRecords < ActiveRecord::Migration[7.2]
  def change
    add_check_constraint :daily_records, "cage_humidity BETWEEN 0 AND 100", name: "daily_records_cage_humidity_range"
  end
end
