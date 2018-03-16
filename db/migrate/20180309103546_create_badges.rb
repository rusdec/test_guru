class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.text :rule, default: ''
      t.boolean :is_active, default: true
      t.text :description, null: false
      t.string :image, null: false
      t.string :title, null: false

      t.timestamps
    end
    add_index :badges, :is_active
  end
end
