class AddDisplayNameToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :display_name, :string
  end
end
