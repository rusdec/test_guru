class DropTestsUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :tests_users
  end
end
