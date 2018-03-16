class RenameIsActiveFromBadges < ActiveRecord::Migration[5.1]
  def change
    rename_column :badges, :is_active, :active
  end
end
