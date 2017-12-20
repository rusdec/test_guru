class AddTestsLevelDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:tests, :level, 0) 
  end
end
