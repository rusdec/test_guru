class AddTestTitleAndLevelUniqeConstraint < ActiveRecord::Migration[5.1]
  def change
    add_index :tests, [:level, :title], unique: true
  end
end
