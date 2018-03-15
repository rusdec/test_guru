class AddIsMultipleToBadgesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :is_multiple, :boolean, default: false
  end
end
