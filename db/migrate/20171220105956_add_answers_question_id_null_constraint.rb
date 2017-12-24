class AddAnswersQuestionIdNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:answers, :question_id, false)
  end
end
