class RemoveResultFromAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_column(:answers, :result, :boolean)
  end
end
