class AddIndexes < ActiveRecord::Migration[5.1]
  def change

    add_index :test_passages, :test_id
    add_index :test_passages, :user_id

    add_index :test_authors, :test_id
    add_index :test_authors, :user_id

    add_index :tests, :category_id
    add_index :tests, :level

    add_index :answers, :question_id
    add_index :answers, :sort

    add_index :questions, :level

    add_index :role_users, :role_id
    add_index :role_users, :user_id
  end
end