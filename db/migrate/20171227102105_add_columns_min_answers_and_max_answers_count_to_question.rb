class AddColumnsMinAnswersAndMaxAnswersCountToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column(:questions, :min_answers, :integer, default: 1)
    add_column(:questions, :max_answers, :integer, default: 4)
  end
end
