class AddResourceIdToUserBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :user_badges, :resource_id, :integer, polymorphic: true
  end
end
