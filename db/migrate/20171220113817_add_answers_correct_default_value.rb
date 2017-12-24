class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:answers, :correct, from: nil, to: false)
  end
end
