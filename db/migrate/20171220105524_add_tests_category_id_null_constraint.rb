class AddTestsCategoryIdNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:tests, :category_id, false)
  end
end
