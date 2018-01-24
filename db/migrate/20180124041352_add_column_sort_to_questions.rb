class AddColumnSortToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column(:questions, :sort, :integer, default: 0)
  end
end
