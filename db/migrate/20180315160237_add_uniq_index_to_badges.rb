class AddUniqIndexToBadges < ActiveRecord::Migration[5.1]
  def change
    add_index :badges, [:rule], unique: true
  end
end
