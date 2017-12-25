class CreateTestAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :test_authors do |t|
      t.integer :user_id, null: false
      t.integer :test_id, null: false
    end
  end
end
