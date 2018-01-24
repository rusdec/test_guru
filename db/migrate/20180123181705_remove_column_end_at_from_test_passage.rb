class RemoveColumnEndAtFromTestPassage < ActiveRecord::Migration[5.1]
  def change
    remove_column(:test_passages, :end_at, :datetime)
  end
end
