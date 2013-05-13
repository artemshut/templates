class DeleteAll < ActiveRecord::Migration
  def up
    drop_table :comments
    remove_column :posts, :comment
  end

  def down
  end
end
