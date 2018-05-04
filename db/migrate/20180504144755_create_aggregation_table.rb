class CreateAggregationTable < ActiveRecord::Migration
  def change
    create_table :measured_value_aggregations do |t|
      t.integer :experience_type_id
      t.references :experience_types, index: true, foreign_key: true
      t.string :name
      t.string :display_name
      t.integer :average_days_saved
      t.integer :average_dollars_saved
    end
  end
end
