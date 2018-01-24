class AddSortToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column(:answers, :sort, :integer, default: 0) 
  end
end
