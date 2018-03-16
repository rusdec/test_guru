class RenameIsMultipleFromBadges < ActiveRecord::Migration[5.1]
  def change
    rename_column :badges, :is_multiple, :multiple
  end
end
