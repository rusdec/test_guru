class AddColumnAuthorIdToTest < ActiveRecord::Migration[5.1]
  def change
    add_column(:tests, :author_id, :integer)
    change_column_null(:tests, :author_id, false)
  end
end
