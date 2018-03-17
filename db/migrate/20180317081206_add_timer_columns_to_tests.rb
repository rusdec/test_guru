class AddTimerColumnsToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :with_timer, :boolean, default: false
    add_column :tests, :timer, :integer, default: 5
  end
end
