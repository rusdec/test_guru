class AddIndexToUserBadges < ActiveRecord::Migration[5.1]
  def change
    add_index :user_badges, [:resource_type, :resource_id]
  end
end
