class AddTypeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string, default: 'User', null: false
    add_index  :users, :type
  end
end
