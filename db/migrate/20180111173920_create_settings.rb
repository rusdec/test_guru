class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :name
      t.string :setting
      t.string :value

      t.timestamps
    end
    change_column_null(:settings, :name, false) 
    change_column_null(:settings, :value, false) 
    change_column_null(:settings, :setting, false) 
    add_index(:settings, :setting, unique: true)
  end
end
