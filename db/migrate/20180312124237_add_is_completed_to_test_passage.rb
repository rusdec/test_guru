class AddIsCompletedToTestPassage < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :is_completed, :boolean, default: false
  end
end
