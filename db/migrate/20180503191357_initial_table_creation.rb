class InitialTableCreation < ActiveRecord::Migration
  def change
    create_table :experience_types do |t|
      t.string :name
      t.string :external_name
    end

    create_table :experiences do |t|
      t.integer :experience_type_id
      t.references :experience_types, index: true, foreign_key: true
      t.string :name
    end

    create_table :measured_values do |t|
      t.references :experiences, index: true, foreign_key: true
      t.string :case_id
      t.integer :experience_id
      t.integer :rating
      t.integer :time_saved
      t.integer :dollar_impact
      t.text :comments
      t.boolean :confidentiality

      t.timestamps
    end

    # create_table :measured_values do |t|
    #   # id
    #   t.integer :case_salesforce_id
    #   t.integer :rating
    #   t.integer :time_saved
    #   t.integer :dollar_impact
    #   t.string :comments
    #   :confidentiality
    #   :created_at
    #   :updated_at
    #   :site_id
    #   :sync_error
    #   :ip_address
    #   :currency_iso_code
    #   :too_soon_time
    #   :too_soon_dollar
    #   :experience_type_id
    # end
  end
end
