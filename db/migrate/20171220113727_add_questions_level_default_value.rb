class AddQuestionsLevelDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:questions, :level, 0)
  end
end
