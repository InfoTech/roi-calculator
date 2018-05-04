class IncreaseScaleOfDecimalColumns < ActiveRecord::Migration
  def change
    change_column :measured_value_aggregations, :average_days_saved, :decimal, precision: 10, scale: 2
    change_column :measured_value_aggregations, :average_dollars_saved, :decimal, precision: 10, scale: 2
  end
end
