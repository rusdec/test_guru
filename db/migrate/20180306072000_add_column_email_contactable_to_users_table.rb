class AddColumnEmailContactableToUsersTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:users, :email_contactable, :boolean, default: false)

    add_index(:users, [:type, :email_contactable])
  end
end
