class CreateTestPassages < ActiveRecord::Migration[5.1]
  def change
    create_table :test_passages do |t|
      t.integer :user_id
      t.integer :test_id
      t.datetime :begin_at
      t.datetime :end_at
      t.boolean :evaluation, :default => false

      t.timestamps
    end

    not_null_columns = [:user_id, :test_id, :begin_at]
    not_null_columns.each do |column|
      change_column_null(:test_passages, column, false)
    end

  
  end
end
