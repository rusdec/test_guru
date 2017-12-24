class AddAnswersUserIdNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:answers, :user_id, false)
  end
end
