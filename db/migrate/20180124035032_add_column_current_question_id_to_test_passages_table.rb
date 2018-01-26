class AddColumnCurrentQuestionIdToTestPassagesTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:test_passages, :current_question_id, :integer)
  end
end
