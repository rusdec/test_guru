class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :question, foreign_key: true, index: true
      t.text :url

      t.timestamps
    end
  end
end
