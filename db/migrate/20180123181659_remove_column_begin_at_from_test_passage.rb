class RemoveColumnBeginAtFromTestPassage < ActiveRecord::Migration[5.1]
  def change
    remove_column(:test_passages, :begin_at, :datetime)
  end
end
